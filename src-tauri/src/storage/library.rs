use std::{
    fs::File,
    io::{BufRead, BufReader},
    path::Path,
};

use rusqlite::{params, params_from_iter, types::Value as SqlValue, OptionalExtension, Transaction};
use serde_json::Value;

use super::{
    db::Database,
    models::{IndexSummary, ItemDetail, ItemEffect, ItemPlacement, ItemSummary, LibraryQuery, PagedItems},
    Result, StorageError,
};

impl Database {
    pub fn index_run_pack(&self, run_id: &str, output_dir: &Path) -> Result<IndexSummary> {
        self.with_conn_mut(|connection| {
            let transaction = connection.transaction()?;
            let existing: i64 = transaction.query_row(
                "SELECT COUNT(*) FROM generated_items WHERE run_id=?1",
                [run_id],
                |row| row.get(0),
            )?;
            if existing > 0 {
                return Err(StorageError::AlreadyIndexed(run_id.to_string()));
            }
            ensure_run_exists(&transaction, run_id)?;
            let summary = import_items(&transaction, run_id, &output_dir.join("items.ndjson"))?;
            transaction.execute(
                "UPDATE runs SET index_status='indexed', index_error=NULL WHERE id=?1",
                [run_id],
            )?;
            transaction.commit()?;
            Ok(summary)
        })
    }

    pub fn rebuild_run_index(&self, run_id: &str, output_dir: &Path) -> Result<IndexSummary> {
        self.with_conn_mut(|connection| {
            let transaction = connection.transaction()?;
            ensure_run_exists(&transaction, run_id)?;
            transaction.execute("DELETE FROM generated_items WHERE run_id=?1", [run_id])?;
            let summary = import_items(&transaction, run_id, &output_dir.join("items.ndjson"))?;
            transaction.execute(
                "UPDATE runs SET index_status='indexed', index_error=NULL WHERE id=?1",
                [run_id],
            )?;
            transaction.commit()?;
            Ok(summary)
        })
    }

    pub fn delete_run_index(&self, run_id: &str) -> Result<u64> {
        self.with_conn(|connection| {
            ensure_run_exists_connection(connection, run_id)?;
            let deleted = connection.execute("DELETE FROM generated_items WHERE run_id=?1", [run_id])?;
            connection.execute(
                "UPDATE runs SET index_status='not_indexed', index_error=NULL WHERE id=?1",
                [run_id],
            )?;
            Ok(deleted as u64)
        })
    }

    pub fn search_items(&self, query: LibraryQuery) -> Result<PagedItems> {
        let limit = query.limit.unwrap_or(100).clamp(1, 200);
        let offset = query.offset.unwrap_or(0);
        let (where_sql, values) = build_item_where(&query);
        let sort_sql = match query.sort.as_deref() {
            Some("name_asc") => "i.name COLLATE NOCASE ASC, i.entry ASC",
            Some("quality_desc") => "i.quality DESC, i.item_level DESC, i.entry ASC",
            Some("required_level_desc") => "i.required_level DESC, i.item_level DESC, i.entry ASC",
            _ => "i.item_level DESC, i.entry ASC",
        };
        self.with_conn(|connection| {
            let count_sql = format!(
                "SELECT COUNT(*) FROM generated_items i JOIN runs r ON r.id=i.run_id {where_sql}"
            );
            let total: i64 = connection.query_row(
                &count_sql,
                params_from_iter(values.iter()),
                |row| row.get(0),
            )?;

            let sql = format!(
                "SELECT i.run_id,i.entry,i.name,i.class_name,i.role,i.quality,i.required_level,i.item_level,i.kind,i.itemset,i.set_name,i.special_effect_feature,i.socket_count,r.seed FROM generated_items i JOIN runs r ON r.id=i.run_id {where_sql} ORDER BY {sort_sql} LIMIT ? OFFSET ?"
            );
            let mut page_values = values.clone();
            page_values.push(i64::from(limit).into());
            page_values.push(i64::from(offset).into());
            let mut statement = connection.prepare(&sql)?;
            let items = statement
                .query_map(params_from_iter(page_values.iter()), row_to_item_summary)?
                .collect::<std::result::Result<Vec<_>, _>>()?;
            Ok(PagedItems { items, total: total as u64, limit, offset })
        })
    }

    pub fn get_item(&self, run_id: &str, entry: i64) -> Result<ItemDetail> {
        let item = self.with_conn(|connection| {
            let sql = "SELECT i.run_id,i.entry,i.name,i.class_name,i.role,i.quality,i.required_level,i.item_level,i.kind,i.itemset,i.set_name,i.special_effect_feature,i.socket_count,r.seed,i.raw_json FROM generated_items i JOIN runs r ON r.id=i.run_id WHERE i.run_id=?1 AND i.entry=?2";
            connection
                .query_row(sql, params![run_id, entry], |row| {
                    let summary = ItemSummary {
                        run_id: row.get(0)?, entry: row.get(1)?, name: row.get(2)?, class_name: row.get(3)?, role: row.get(4)?,
                        quality: row.get(5)?, required_level: row.get(6)?, item_level: row.get(7)?, kind: row.get(8)?, itemset: row.get(9)?,
                        set_name: row.get(10)?, special_effect_feature: row.get(11)?, socket_count: row.get(12)?, seed: row.get(13)?,
                    };
                    let raw: String = row.get(14)?;
                    Ok((summary, raw))
                })
                .optional()?
                .ok_or_else(|| StorageError::ItemNotFound { run_id: run_id.to_string(), entry })
        })?;

        let (summary, raw_string) = item;
        let raw = serde_json::from_str(&raw_string)?;
        let effects = self.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT slot,spell_id,trigger,charges,ppm_rate,cooldown,category,category_cooldown,raw_json FROM item_effects WHERE run_id=?1 AND entry=?2 ORDER BY slot")?;
            let rows = statement.query_map(params![run_id, entry], |row| {
                let raw: String = row.get(8)?;
                Ok(ItemEffect { slot: row.get(0)?, spell_id: row.get(1)?, trigger: row.get(2)?, charges: row.get(3)?, ppm_rate: row.get(4)?, cooldown: row.get(5)?, category: row.get(6)?, category_cooldown: row.get(7)?, raw: serde_json::from_str(&raw).unwrap_or(Value::Null) })
            })?.collect::<std::result::Result<Vec<_>, _>>()?;
            Ok(rows)
        })?;
        let sockets = self.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT color FROM item_sockets WHERE run_id=?1 AND entry=?2 ORDER BY slot")?;
            Ok(statement.query_map(params![run_id, entry], |row| row.get::<_, i64>(0))?.collect::<std::result::Result<Vec<_>, _>>()?)
        })?;
        let placements = self.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT destination,profile_id,map_id,difficulty_id,instance,encounter,pool_id,chance,raw_json FROM item_placements WHERE run_id=?1 AND entry=?2 ORDER BY destination,instance,encounter")?;
            Ok(statement.query_map(params![run_id, entry], |row| {
                let raw: String = row.get(8)?;
                Ok(ItemPlacement { destination: row.get(0)?, profile_id: row.get(1)?, map_id: row.get(2)?, difficulty_id: row.get(3)?, instance: row.get(4)?, encounter: row.get(5)?, pool_id: row.get(6)?, chance: row.get(7)?, raw: serde_json::from_str(&raw).unwrap_or(Value::Null) })
            })?.collect::<std::result::Result<Vec<_>, _>>()?)
        })?;
        let run = self.get_run_record(run_id)?;
        Ok(ItemDetail { item: summary, raw, effects, sockets, placements, run })
    }
}

fn ensure_run_exists(transaction: &Transaction<'_>, run_id: &str) -> Result<()> {
    let exists: Option<i64> = transaction
        .query_row("SELECT 1 FROM runs WHERE id=?1", [run_id], |row| row.get(0))
        .optional()?;
    if exists.is_none() {
        return Err(StorageError::RunNotFound(run_id.to_string()));
    }
    Ok(())
}

fn ensure_run_exists_connection(connection: &rusqlite::Connection, run_id: &str) -> Result<()> {
    let exists: Option<i64> = connection
        .query_row("SELECT 1 FROM runs WHERE id=?1", [run_id], |row| row.get(0))
        .optional()?;
    if exists.is_none() {
        return Err(StorageError::RunNotFound(run_id.to_string()));
    }
    Ok(())
}

fn import_items(transaction: &Transaction<'_>, run_id: &str, path: &Path) -> Result<IndexSummary> {
    let file = File::open(path)?;
    let reader = BufReader::new(file);
    let mut item_count = 0_u64;
    let mut effect_count = 0_u64;
    let mut socket_count = 0_u64;

    let mut insert_item = transaction.prepare_cached(
        "INSERT INTO generated_items(run_id,entry,name,class_name,role,quality,required_level,item_level,kind,weapon_kind,inventory_type,subclass,displayid,reference_entry,armor,dps,itemset,set_name,special_effect_feature,effect_source_entry,effect_source_spell,socket_bonus,disenchant_id,socket_count,raw_json) VALUES (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11,?12,?13,?14,?15,?16,?17,?18,?19,?20,?21,?22,?23,?24,?25)"
    )?;
    let mut insert_effect = transaction.prepare_cached(
        "INSERT INTO item_effects(run_id,entry,slot,spell_id,trigger,charges,ppm_rate,cooldown,category,category_cooldown,raw_json) VALUES (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)"
    )?;
    let mut insert_socket = transaction.prepare_cached(
        "INSERT INTO item_sockets(run_id,entry,slot,color) VALUES (?1,?2,?3,?4)"
    )?;

    for (index, line) in reader.lines().enumerate() {
        let line = line?;
        if line.trim().is_empty() { continue; }
        let item: Value = serde_json::from_str(&line).map_err(|error| {
            StorageError::InvalidInput(format!("items.ndjson line {}: {error}", index + 1))
        })?;
        let entry = int(&item, "entry").ok_or_else(|| StorageError::InvalidInput(format!("items.ndjson line {} has no entry", index + 1)))?;
        let name = string(&item, "name").unwrap_or_default();
        let sockets = item.get("sockets").and_then(Value::as_array).cloned().unwrap_or_default();
        insert_item.execute(params![
            run_id, entry, name, string(&item,"class_name"), string(&item,"role"), int(&item,"Quality"), int(&item,"RequiredLevel"), int(&item,"ItemLevel"),
            string(&item,"kind"), string(&item,"weapon_kind"), int(&item,"InventoryType"), int(&item,"subclass"), int(&item,"displayid"), int(&item,"reference_entry"),
            int(&item,"armor"), float(&item,"dps"), int(&item,"itemset"), string(&item,"set_name"), string(&item,"special_effect_feature"), int(&item,"effect_source_entry"),
            int(&item,"effect_source_spell"), int(&item,"socketBonus"), int(&item,"DisenchantID"), sockets.len() as i64, line,
        ])?;
        item_count += 1;

        for (slot, socket) in sockets.iter().enumerate() {
            if let Some(color) = socket.as_i64() {
                insert_socket.execute(params![run_id, entry, slot as i64, color])?;
                socket_count += 1;
            }
        }
        if let Some(effects) = item.get("spell_slots").and_then(Value::as_array) {
            for (slot, effect) in effects.iter().enumerate() {
                insert_effect.execute(params![
                    run_id, entry, slot as i64, int(effect,"spell_id"), int(effect,"trigger"), int(effect,"charges"), float(effect,"ppm_rate"),
                    int(effect,"cooldown"), int(effect,"category"), int(effect,"category_cooldown"), serde_json::to_string(effect)?,
                ])?;
                effect_count += 1;
            }
        }
    }
    Ok(IndexSummary { run_id: run_id.to_string(), item_count, effect_count, socket_count })
}

fn build_item_where(query: &LibraryQuery) -> (String, Vec<SqlValue>) {
    let mut clauses = Vec::new();
    let mut values = Vec::new();
    macro_rules! eq_filter { ($field:expr, $value:expr) => { if let Some(value) = $value { clauses.push(format!("{} = ?", $field)); values.push(value.into()); } }; }
    eq_filter!("i.run_id", query.run_id.clone());
    eq_filter!("r.seed", query.seed.clone());
    eq_filter!("i.class_name", query.class_name.clone());
    eq_filter!("i.role", query.role.clone());
    eq_filter!("i.quality", query.quality);
    eq_filter!("i.kind", query.kind.clone());
    eq_filter!("i.itemset", query.itemset);
    eq_filter!("i.special_effect_feature", query.effect_type.clone());
    eq_filter!("i.entry", query.entry);
    if let Some(text) = query.text.as_ref().filter(|value| !value.trim().is_empty()) {
        clauses.push("i.name LIKE ? ESCAPE '\\' COLLATE NOCASE".into());
        values.push(format!("%{}%", escape_like(text.trim())).into());
    }
    range_filter(&mut clauses, &mut values, "i.required_level", query.required_level_min, query.required_level_max);
    range_filter(&mut clauses, &mut values, "i.item_level", query.item_level_min, query.item_level_max);
    if let Some(minimum) = query.minimum_socket_count {
        clauses.push("i.socket_count >= ?".into()); values.push(minimum.into());
    }
    if let Some(destination) = query.placement_type.clone() {
        clauses.push("EXISTS (SELECT 1 FROM item_placements p WHERE p.run_id=i.run_id AND p.entry=i.entry AND p.destination=?)".into());
        values.push(destination.into());
    }
    if clauses.is_empty() { (String::new(), values) } else { (format!("WHERE {}", clauses.join(" AND ")), values) }
}

fn range_filter(clauses: &mut Vec<String>, values: &mut Vec<SqlValue>, field: &str, min: Option<i64>, max: Option<i64>) {
    if let Some(value) = min { clauses.push(format!("{field} >= ?")); values.push(value.into()); }
    if let Some(value) = max { clauses.push(format!("{field} <= ?")); values.push(value.into()); }
}

fn escape_like(value: &str) -> String {
    value.replace('\\', "\\\\").replace('%', "\\%").replace('_', "\\_")
}

fn row_to_item_summary(row: &rusqlite::Row<'_>) -> rusqlite::Result<ItemSummary> {
    Ok(ItemSummary { run_id: row.get(0)?, entry: row.get(1)?, name: row.get(2)?, class_name: row.get(3)?, role: row.get(4)?, quality: row.get(5)?, required_level: row.get(6)?, item_level: row.get(7)?, kind: row.get(8)?, itemset: row.get(9)?, set_name: row.get(10)?, special_effect_feature: row.get(11)?, socket_count: row.get(12)?, seed: row.get(13)? })
}

fn int(value: &Value, key: &str) -> Option<i64> { value.get(key).and_then(Value::as_i64) }
fn float(value: &Value, key: &str) -> Option<f64> { value.get(key).and_then(|value| value.as_f64().or_else(|| value.as_i64().map(|v| v as f64))) }
fn string(value: &Value, key: &str) -> Option<String> { value.get(key).and_then(Value::as_str).map(str::to_owned) }

#[cfg(test)]
mod tests {
    use super::*;
    use crate::storage::models::RunConfiguration;
    use serde_json::json;
    use std::{fs, io::Write};

    fn run(db: &Database, dir: &Path) -> String {
        db.create_run(&RunConfiguration { seed: "123".into(), output_dir: dir.display().to_string(), engine_version: "test".into(), protocol_version: 1, expansion: "Wrath".into(), item_count: 1, classes: vec!["Paladin".into()], config: json!({}) }).unwrap().id
    }

    #[test]
    fn imports_item_effects_and_sockets_transactionally() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-library-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run_id = run(&db, &dir);
        let mut file = File::create(dir.join("items.ndjson")).unwrap();
        writeln!(file, "{}", json!({"entry":300001,"name":"Crown of Test","class_name":"Paladin","role":"tank","Quality":5,"RequiredLevel":80,"ItemLevel":264,"kind":"head","sockets":[1,2],"spell_slots":[{"spell_id":123,"trigger":1,"charges":0,"ppm_rate":0.0,"cooldown":-1,"category":0,"category_cooldown":-1}]})).unwrap();
        let summary = db.index_run_pack(&run_id, &dir).unwrap();
        assert_eq!(summary.item_count, 1);
        assert_eq!(summary.effect_count, 1);
        assert_eq!(summary.socket_count, 2);
        assert_eq!(db.search_items(LibraryQuery { quality: Some(5), ..Default::default() }).unwrap().total, 1);
        fs::remove_dir_all(dir).ok();
    }


    #[test]
    fn malformed_ndjson_rolls_back_entire_run_index() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-library-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run_id = run(&db, &dir);
        fs::write(
            dir.join("items.ndjson"),
            "{\"entry\":1,\"name\":\"Good\"}\n{not valid json}\n",
        ).unwrap();
        let error = db.index_run_pack(&run_id, &dir).unwrap_err().to_string();
        assert!(error.contains("line 2"));
        assert_eq!(db.search_items(LibraryQuery { run_id: Some(run_id.clone()), ..Default::default() }).unwrap().total, 0);
        assert_eq!(db.get_run_record(&run_id).unwrap().index_status, "not_indexed");
        fs::remove_dir_all(dir).ok();
    }

    #[test]
    fn search_combines_filters_paginates_and_loads_detail() {
        let db = Database::open_in_memory().unwrap();
        let dir_a = std::env::temp_dir().join(format!("wotlk-search-a-{}", uuid::Uuid::new_v4()));
        let dir_b = std::env::temp_dir().join(format!("wotlk-search-b-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir_a).unwrap();
        fs::create_dir_all(&dir_b).unwrap();
        let run_a = run(&db, &dir_a);
        let run_b = db.create_run(&RunConfiguration { seed: "456".into(), output_dir: dir_b.display().to_string(), engine_version: "test".into(), protocol_version: 1, expansion: "Wrath".into(), item_count: 1, classes: vec!["Mage".into()], config: json!({}) }).unwrap().id;
        fs::write(dir_a.join("items.ndjson"), [
            json!({"entry":10,"name":"Crown of Dawn","class_name":"Paladin","role":"tank","Quality":5,"RequiredLevel":80,"ItemLevel":264,"kind":"head","itemset":42,"set_name":"Dawn Oath","sockets":[1,2],"spell_slots":[]}).to_string(),
            json!({"entry":11,"name":"Crown of Dusk","class_name":"Paladin","role":"tank","Quality":4,"RequiredLevel":80,"ItemLevel":245,"kind":"head","sockets":[],"spell_slots":[]}).to_string(),
        ].join("\n") + "\n").unwrap();
        fs::write(dir_b.join("items.ndjson"), json!({"entry":12,"name":"Crown of Dawn","class_name":"Mage","role":"caster","Quality":5,"RequiredLevel":80,"ItemLevel":277,"kind":"head","sockets":[4],"spell_slots":[]}).to_string() + "\n").unwrap();
        db.index_run_pack(&run_a, &dir_a).unwrap();
        db.index_run_pack(&run_b, &dir_b).unwrap();

        let page = db.search_items(LibraryQuery {
            text: Some("crown".into()), class_name: Some("Paladin".into()), quality: Some(5),
            item_level_min: Some(250), run_id: Some(run_a.clone()), limit: Some(1), offset: Some(0),
            ..Default::default()
        }).unwrap();
        assert_eq!(page.total, 1);
        assert_eq!(page.items[0].entry, 10);
        let detail = db.get_item(&run_a, 10).unwrap();
        assert_eq!(detail.raw["set_name"], "Dawn Oath");
        assert_eq!(detail.sockets, vec![1, 2]);

        let seed_page = db.search_items(LibraryQuery { seed: Some("456".into()), entry: Some(12), ..Default::default() }).unwrap();
        assert_eq!(seed_page.total, 1);
        assert_eq!(seed_page.items[0].class_name.as_deref(), Some("Mage"));
        fs::remove_dir_all(dir_a).ok();
        fs::remove_dir_all(dir_b).ok();
    }

    #[test]
    #[ignore = "explicit 100k-row import benchmark"]
    fn imports_one_hundred_thousand_simple_items() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-library-100k-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run_id = run(&db, &dir);
        let mut file = File::create(dir.join("items.ndjson")).unwrap();
        for entry in 1..=100_000_i64 {
            writeln!(file, "{}", json!({"entry":entry,"name":format!("Item {entry}"),"Quality":2,"RequiredLevel":1,"ItemLevel":1,"sockets":[],"spell_slots":[]})).unwrap();
        }
        let started = std::time::Instant::now();
        let summary = db.index_run_pack(&run_id, &dir).unwrap();
        eprintln!("100k NDJSON import took {:?}", started.elapsed());
        assert_eq!(summary.item_count, 100_000);
        fs::remove_dir_all(dir).ok();
    }

    #[test]
    fn duplicate_import_is_rejected() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-library-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run_id = run(&db, &dir);
        fs::write(dir.join("items.ndjson"), "{\"entry\":1,\"name\":\"Test\"}\n").unwrap();
        db.index_run_pack(&run_id, &dir).unwrap();
        assert!(matches!(db.index_run_pack(&run_id, &dir), Err(StorageError::AlreadyIndexed(_))));
        fs::remove_dir_all(dir).ok();
    }
}
