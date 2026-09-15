use std::{collections::HashMap, fs, path::{Path, PathBuf}};

use chrono::{DateTime, Utc};
use rusqlite::{params, OptionalExtension};
use serde_json::Value;

use super::{
    db::Database,
    models::{ReportPageRequest, ReportRecord, ReportTablePage},
    Result, StorageError,
};

const KNOWN_REPORTS: &[(&str, &str)] = &[
    ("validation_report.json", "validation"),
    ("manifest.csv", "manifest"),
    ("world_item_placements.csv", "world_loot"),
    ("dungeon_raid_item_placements.csv", "dungeon_raid"),
    ("encounter_profile_coverage.csv", "encounter_coverage"),
    ("difficulty_band_comparison.csv", "difficulty_bands"),
    ("encounter_band_rejections.csv", "encounter_rejections"),
    ("set_manifest.csv", "sets"),
    ("encounter_distribution_audit.csv", "distribution"),
    ("gameobject_reward_targets.csv", "source_audit"),
];

impl Database {
    pub fn index_reports(&self, run_id: &str, output_dir: &Path) -> Result<Vec<ReportRecord>> {
        self.get_run_record(run_id)?;
        let discovered: Vec<(&str, &str, PathBuf)> = KNOWN_REPORTS
            .iter()
            .filter_map(|(filename, report_type)| {
                let path = output_dir.join(filename);
                path.is_file().then_some((*filename, *report_type, path))
            })
            .collect();

        self.with_conn_mut(|connection| {
            let transaction = connection.transaction()?;
            transaction.execute("DELETE FROM report_index WHERE run_id=?1", [run_id])?;
            transaction.execute("DELETE FROM item_placements WHERE run_id=?1", [run_id])?;
            for (_, report_type, path) in &discovered {
                let metadata = fs::metadata(path)?;
                let modified_at = metadata.modified().ok().map(system_time_rfc3339);
                transaction.execute(
                    "INSERT INTO report_index(run_id,report_type,path,import_state,size,modified_at) VALUES (?1,?2,?3,'available',?4,?5)",
                    params![run_id, report_type, path.display().to_string(), metadata.len() as i64, modified_at],
                )?;
            }
            for (filename, _, path) in &discovered {
                if *filename == "world_item_placements.csv" {
                    import_placements(&transaction, run_id, path, "world")?;
                } else if *filename == "dungeon_raid_item_placements.csv" {
                    import_placements(&transaction, run_id, path, "dungeon_raid")?;
                }
            }
            transaction.commit()?;
            Ok(())
        })?;
        self.list_reports(run_id)
    }

    pub fn list_reports(&self, run_id: &str) -> Result<Vec<ReportRecord>> {
        self.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT id,run_id,report_type,path,import_state,size,modified_at FROM report_index WHERE run_id=?1 ORDER BY report_type,path")?;
            Ok(statement.query_map([run_id], |row| Ok(ReportRecord { id: row.get(0)?, run_id: row.get(1)?, report_type: row.get(2)?, path: row.get(3)?, import_state: row.get(4)?, size: row.get(5)?, modified_at: row.get(6)? }))?.collect::<std::result::Result<Vec<_>, _>>()?)
        })
    }

    pub fn get_report(&self, report_id: i64) -> Result<ReportRecord> {
        self.with_conn(|connection| {
            connection.query_row(
                "SELECT id,run_id,report_type,path,import_state,size,modified_at FROM report_index WHERE id=?1",
                [report_id],
                |row| Ok(ReportRecord { id: row.get(0)?, run_id: row.get(1)?, report_type: row.get(2)?, path: row.get(3)?, import_state: row.get(4)?, size: row.get(5)?, modified_at: row.get(6)? }),
            ).optional()?.ok_or(StorageError::NotFound(format!("report {report_id}")))
        })
    }

    pub fn read_report_table(&self, run_id: &str, report_type: &str, page: ReportPageRequest) -> Result<ReportTablePage> {
        let path = self.with_conn(|connection| {
            connection.query_row(
                "SELECT path FROM report_index WHERE run_id=?1 AND report_type=?2 ORDER BY id LIMIT 1",
                params![run_id, report_type],
                |row| row.get::<_, String>(0),
            ).optional()?.ok_or_else(|| StorageError::InvalidInput(format!("report {report_type} is not indexed for run {run_id}")))
        })?;
        let path = PathBuf::from(path);
        let offset = page.offset.unwrap_or(0);
        let limit = page.limit.unwrap_or(100).clamp(1, 500);
        if path.extension().and_then(|value| value.to_str()) == Some("json") {
            let raw: Value = serde_json::from_slice(&fs::read(&path)?)?;
            let mut rows = Vec::new();
            if let Some(object) = raw.as_object() {
                for (key, value) in object.iter().skip(offset as usize).take(limit as usize) {
                    rows.push(vec![key.clone(), display_json(value)]);
                }
            }
            let total = raw.as_object().map(|value| value.len()).unwrap_or(0);
            return Ok(ReportTablePage { report_type: report_type.into(), headers: vec!["Field".into(), "Value".into()], rows, offset, limit, has_more: (offset as usize + limit as usize) < total, raw_json: Some(raw) });
        }
        let mut reader = csv::Reader::from_path(&path)?;
        let headers = reader.headers()?.iter().map(str::to_owned).collect::<Vec<_>>();
        let mut rows = Vec::new();
        let mut total_seen = 0_usize;
        for result in reader.records() {
            let record = result?;
            if total_seen >= offset as usize && rows.len() < limit as usize {
                rows.push(record.iter().map(str::to_owned).collect());
            }
            total_seen += 1;
        }
        Ok(ReportTablePage { report_type: report_type.into(), headers, rows, offset, limit, has_more: (offset as usize + limit as usize) < total_seen, raw_json: None })
    }
}

fn import_placements(transaction: &rusqlite::Transaction<'_>, run_id: &str, path: &Path, fallback_destination: &str) -> Result<()> {
    let mut reader = csv::Reader::from_path(path)?;
    let headers = reader.headers()?.clone();
    let positions: HashMap<&str, usize> = headers.iter().enumerate().map(|(index, name)| (name, index)).collect();
    for record in reader.records() {
        let record = record?;
        let entry = get(&record, &positions, "entry").and_then(|value| value.parse::<i64>().ok());
        let Some(entry) = entry else { continue; };
        let destination = get(&record, &positions, "destination").filter(|value| !value.is_empty()).unwrap_or(fallback_destination);
        let raw = headers.iter().zip(record.iter()).map(|(key, value)| (key.to_string(), Value::String(value.to_string()))).collect::<serde_json::Map<_,_>>();
        transaction.execute(
            "INSERT INTO item_placements(run_id,entry,destination,profile_id,map_id,difficulty_id,instance,encounter,pool_id,chance,raw_json) VALUES (?1,?2,?3,?4,?5,?6,?7,?8,?9,?10,?11)",
            params![
                run_id, entry, destination,
                get(&record,&positions,"profile_id"), parse_i64(get(&record,&positions,"map_id")), parse_i64(get(&record,&positions,"difficulty_id")),
                get(&record,&positions,"instance"), get(&record,&positions,"encounter"), parse_i64(get(&record,&positions,"pool_id")), parse_f64(get(&record,&positions,"chance")),
                Value::Object(raw).to_string(),
            ],
        )?;
    }
    Ok(())
}

fn get<'a>(record: &'a csv::StringRecord, positions: &HashMap<&str, usize>, name: &str) -> Option<&'a str> {
    positions.get(name).and_then(|index| record.get(*index))
}
fn parse_i64(value: Option<&str>) -> Option<i64> { value.filter(|value| !value.is_empty()).and_then(|value| value.parse().ok()) }
fn parse_f64(value: Option<&str>) -> Option<f64> { value.filter(|value| !value.is_empty()).and_then(|value| value.parse().ok()) }
fn display_json(value: &Value) -> String { if let Some(text)=value.as_str(){text.to_string()} else { serde_json::to_string(value).unwrap_or_default() } }
fn system_time_rfc3339(value: std::time::SystemTime) -> String { DateTime::<Utc>::from(value).to_rfc3339() }

#[cfg(test)]
mod tests {
    use super::*;
    use crate::storage::models::RunConfiguration;
    use serde_json::json;


    #[test]
    fn indexes_reports_and_imports_world_and_encounter_placements() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-report-placement-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run = db.create_run(&RunConfiguration { seed: "2".into(), output_dir: dir.display().to_string(), engine_version: "test".into(), protocol_version: 1, expansion: "Wrath".into(), item_count: 1, classes: vec!["Paladin".into()], config: json!({}) }).unwrap();
        fs::write(dir.join("items.ndjson"), "{\"entry\":900001,\"name\":\"Test Blade\"}\n").unwrap();
        db.index_run_pack(&run.id, &dir).unwrap();
        fs::write(dir.join("validation_report.json"), "{\"validation_errors\":0,\"item_count\":1}").unwrap();
        fs::write(dir.join("world_item_placements.csv"), "entry,name,destination,pool_id,chance\n900001,Test Blade,world,3000001,2.0\n").unwrap();
        fs::write(dir.join("dungeon_raid_item_placements.csv"), "entry,name,destination,profile_id,map_id,difficulty_id,instance,encounter,pool_id,chance\n900001,Test Blade,raid,icc-25,631,4,Icecrown Citadel,Lord Marrowgar,3100001,4.0\n").unwrap();
        fs::write(dir.join("set_manifest.csv"), "set_id,set_name,entry,name\n1,Test Set,900001,Test Blade\n").unwrap();

        let reports = db.index_reports(&run.id, &dir).unwrap();
        assert_eq!(reports.len(), 4);
        let detail = db.get_item(&run.id, 900001).unwrap();
        assert_eq!(detail.placements.len(), 2);
        assert!(detail.placements.iter().any(|placement| placement.destination == "world"));
        assert!(detail.placements.iter().any(|placement| placement.destination == "raid"));
        let page = db.read_report_table(&run.id, "validation", ReportPageRequest::default()).unwrap();
        assert_eq!(page.headers, vec!["Field", "Value"]);
        assert_eq!(page.raw_json.unwrap()["validation_errors"], 0);
        fs::remove_dir_all(dir).ok();
    }

    #[test]
    fn resolves_only_indexed_report_ids() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-report-open-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run = db.create_run(&RunConfiguration { seed: "3".into(), output_dir: dir.display().to_string(), engine_version: "test".into(), protocol_version: 1, expansion: "Wrath".into(), item_count: 0, classes: vec![], config: json!({}) }).unwrap();
        fs::write(dir.join("validation_report.json"), "{\"validation_errors\":0}").unwrap();
        let indexed = db.index_reports(&run.id, &dir).unwrap();
        let report = db.get_report(indexed[0].id).unwrap();
        assert_eq!(report.path, dir.join("validation_report.json").display().to_string());
        assert!(matches!(db.get_report(9_999_999), Err(StorageError::NotFound(_))));
        fs::remove_dir_all(dir).ok();
    }

    #[test]
    fn discovers_known_reports_only() {
        let db = Database::open_in_memory().unwrap();
        let dir = std::env::temp_dir().join(format!("wotlk-reports-{}", uuid::Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        let run = db.create_run(&RunConfiguration { seed: "1".into(), output_dir: dir.display().to_string(), engine_version: "test".into(), protocol_version: 1, expansion: "Wrath".into(), item_count: 0, classes: vec![], config: json!({}) }).unwrap();
        fs::write(dir.join("validation_report.json"), "{\"validation_errors\":0}").unwrap();
        fs::write(dir.join("unknown.csv"), "a,b\n1,2\n").unwrap();
        let reports = db.index_reports(&run.id, &dir).unwrap();
        assert_eq!(reports.len(), 1);
        assert_eq!(reports[0].report_type, "validation");
        fs::remove_dir_all(dir).ok();
    }
}
