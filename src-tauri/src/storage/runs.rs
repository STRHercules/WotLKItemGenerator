use chrono::Utc;
use rusqlite::{params, params_from_iter, types::Value as SqlValue, OptionalExtension, Row};
use serde_json::Value;
use uuid::Uuid;

use super::{
    db::Database,
    models::{RunConfiguration, RunDetail, RunFilter, RunRecord, RunStatusUpdate},
    Result, StorageError,
};

const TERMINAL_STATUSES: &[&str] = &["complete", "failed", "cancelled"];
const VALID_STATUSES: &[&str] = &[
    "idle", "checking_sources", "configuring", "generating_skeletons", "finalizing_items",
    "validating", "writing_output", "indexing_library", "complete", "failed", "cancelled",
];

impl Database {
    pub fn create_run(&self, config: &RunConfiguration) -> Result<RunRecord> {
        let id = Uuid::new_v4().to_string();
        self.create_run_with_id(&id, config)
    }

    pub fn create_run_with_id(&self, id: &str, config: &RunConfiguration) -> Result<RunRecord> {
        if id.trim().is_empty() {
            return Err(StorageError::InvalidInput("run id must not be empty".into()));
        }
        let started_at = Utc::now().to_rfc3339();
        let classes_json = serde_json::to_string(&config.classes)?;
        let config_json = serde_json::to_string(&config.config)?;
        self.with_conn(|connection| {
            connection.execute(
                "INSERT INTO runs(id, seed, status, started_at, output_dir, engine_version, protocol_version, expansion, item_count, classes_json) VALUES (?1,?2,'configuring',?3,?4,?5,?6,?7,?8,?9)",
                params![id, config.seed, started_at, config.output_dir, config.engine_version, config.protocol_version, config.expansion, config.item_count, classes_json],
            )?;
            connection.execute(
                "INSERT INTO run_configuration(run_id, config_json) VALUES (?1,?2)",
                params![id, config_json],
            )?;
            Ok(())
        })?;
        self.get_run_record(id)
    }

    pub fn update_run_runtime_metadata(&self, id: &str, seed: &str, output_dir: &str) -> Result<()> {
        if seed.trim().is_empty() || output_dir.trim().is_empty() {
            return Err(StorageError::InvalidInput("runtime seed and output directory are required".into()));
        }
        self.with_conn(|connection| {
            let changed = connection.execute(
                "UPDATE runs SET seed=?2, output_dir=?3 WHERE id=?1",
                params![id, seed, output_dir],
            )?;
            if changed == 0 {
                return Err(StorageError::RunNotFound(id.to_string()));
            }
            Ok(())
        })
    }

    pub fn update_run_status(&self, id: &str, update: RunStatusUpdate) -> Result<()> {
        if !VALID_STATUSES.contains(&update.status.as_str()) {
            return Err(StorageError::InvalidInput(format!("unknown run status {}", update.status)));
        }
        self.with_conn(|connection| {
            let current: String = connection
                .query_row("SELECT status FROM runs WHERE id=?1", [id], |row| row.get(0))
                .optional()?
                .ok_or_else(|| StorageError::RunNotFound(id.to_string()))?;
            if TERMINAL_STATUSES.contains(&current.as_str()) && current != update.status {
                return Err(StorageError::InvalidRunTransition { from: current, to: update.status });
            }
            let summary = update.summary.as_ref().map(serde_json::to_string).transpose()?;
            connection.execute(
                "UPDATE runs SET status=?2, finished_at=COALESCE(?3,finished_at), elapsed_ms=COALESCE(?4,elapsed_ms), validation_error_count=COALESCE(?5,validation_error_count), summary_json=COALESCE(?6,summary_json), index_status=COALESCE(?7,index_status), index_error=?8 WHERE id=?1",
                params![id, update.status, update.finished_at, update.elapsed_ms, update.validation_error_count, summary, update.index_status, update.index_error],
            )?;
            Ok(())
        })
    }

    pub fn get_run_record(&self, id: &str) -> Result<RunRecord> {
        self.with_conn(|connection| {
            connection
                .query_row(
                    "SELECT id,seed,status,started_at,finished_at,elapsed_ms,output_dir,engine_version,protocol_version,validation_error_count,summary_json,index_status,index_error,expansion,item_count,classes_json FROM runs WHERE id=?1",
                    [id],
                    row_to_run,
                )
                .optional()?
                .ok_or_else(|| StorageError::RunNotFound(id.to_string()))
        })
    }

    pub fn get_run(&self, id: &str) -> Result<RunDetail> {
        let run = self.get_run_record(id)?;
        let configuration = self.with_conn(|connection| {
            let raw: String = connection.query_row(
                "SELECT config_json FROM run_configuration WHERE run_id=?1",
                [id],
                |row| row.get(0),
            )?;
            Ok(serde_json::from_str(&raw)?)
        })?;
        let sources = self.list_run_sources(id)?;
        Ok(RunDetail { run, configuration, sources })
    }

    pub fn list_runs(&self, filter: RunFilter) -> Result<Vec<RunRecord>> {
        let mut clauses = Vec::new();
        let mut values: Vec<SqlValue> = Vec::new();
        if let Some(status) = filter.status {
            clauses.push("status = ?".to_string());
            values.push(status.into());
        }
        if let Some(expansion) = filter.expansion {
            clauses.push("expansion = ?".to_string());
            values.push(expansion.into());
        }
        if let Some(search) = filter.search.filter(|value| !value.trim().is_empty()) {
            clauses.push("(seed LIKE ? COLLATE NOCASE OR classes_json LIKE ? COLLATE NOCASE OR output_dir LIKE ? COLLATE NOCASE)".to_string());
            let pattern = format!("%{}%", search.trim());
            values.extend([pattern.clone().into(), pattern.clone().into(), pattern.into()]);
        }
        let mut sql = "SELECT id,seed,status,started_at,finished_at,elapsed_ms,output_dir,engine_version,protocol_version,validation_error_count,summary_json,index_status,index_error,expansion,item_count,classes_json FROM runs".to_string();
        if !clauses.is_empty() {
            sql.push_str(" WHERE ");
            sql.push_str(&clauses.join(" AND "));
        }
        sql.push_str(" ORDER BY started_at DESC LIMIT ?");
        values.push(i64::from(filter.limit.unwrap_or(100).clamp(1, 500)).into());
        self.with_conn(|connection| {
            let mut statement = connection.prepare(&sql)?;
            let rows = statement
                .query_map(params_from_iter(values.iter()), row_to_run)?
                .collect::<std::result::Result<Vec<_>, _>>()?;
            Ok(rows)
        })
    }
}

fn row_to_run(row: &Row<'_>) -> rusqlite::Result<RunRecord> {
    let summary_json: String = row.get(10)?;
    let classes_json: String = row.get(15)?;
    Ok(RunRecord {
        id: row.get(0)?,
        seed: row.get(1)?,
        status: row.get(2)?,
        started_at: row.get(3)?,
        finished_at: row.get(4)?,
        elapsed_ms: row.get(5)?,
        output_dir: row.get(6)?,
        engine_version: row.get(7)?,
        protocol_version: row.get(8)?,
        validation_error_count: row.get(9)?,
        summary: serde_json::from_str(&summary_json).unwrap_or(Value::Null),
        index_status: row.get(11)?,
        index_error: row.get(12)?,
        expansion: row.get(13)?,
        item_count: row.get(14)?,
        classes: serde_json::from_str(&classes_json).unwrap_or_default(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::json;

    fn config(seed: &str, count: u64) -> RunConfiguration {
        RunConfiguration {
            seed: seed.into(),
            output_dir: format!("C:/packs/{count}"),
            engine_version: "0.1.0".into(),
            protocol_version: 1,
            expansion: "Wrath".into(),
            item_count: count,
            classes: vec!["Mage".into()],
            config: json!({"number": count}),
        }
    }

    #[test]
    fn runtime_metadata_replaces_provisional_seed_and_output() {
        let db = Database::open_in_memory().unwrap();
        db.create_run_with_id("runtime-meta", &config("auto", 10)).unwrap();
        db.update_run_runtime_metadata("runtime-meta", "9876543210", "C:/Packs/generated-9876543210").unwrap();
        let record = db.get_run_record("runtime-meta").unwrap();
        assert_eq!(record.seed, "9876543210");
        assert_eq!(record.output_dir, "C:/Packs/generated-9876543210");
    }

    #[test]
    fn explicit_run_id_is_preserved_for_engine_bridge() {
        let db = Database::open_in_memory().unwrap();
        let record = db.create_run_with_id("run-from-engine-bridge", &config("pending", 10)).unwrap();
        assert_eq!(record.id, "run-from-engine-bridge");
        assert_eq!(db.get_run_record("run-from-engine-bridge").unwrap().seed, "pending");
    }

    #[test]
    fn repeated_seed_runs_have_distinct_identity_and_config() {
        let db = Database::open_in_memory().unwrap();
        let first = db.create_run(&config("123", 10)).unwrap();
        let second = db.create_run(&config("123", 20)).unwrap();
        assert_ne!(first.id, second.id);
        assert_eq!(db.get_run(&first.id).unwrap().configuration["number"], 10);
        assert_eq!(db.get_run(&second.id).unwrap().configuration["number"], 20);
        assert_eq!(db.list_runs(RunFilter::default()).unwrap().len(), 2);
    }

    #[test]
    fn terminal_status_cannot_rewind() {
        let db = Database::open_in_memory().unwrap();
        let run = db.create_run(&config("123", 10)).unwrap();
        db.update_run_status(&run.id, RunStatusUpdate {
            status: "complete".into(), finished_at: Some(Utc::now().to_rfc3339()), elapsed_ms: Some(10),
            validation_error_count: Some(0), summary: None, index_status: None, index_error: None,
        }).unwrap();
        let result = db.update_run_status(&run.id, RunStatusUpdate {
            status: "validating".into(), finished_at: None, elapsed_ms: None,
            validation_error_count: None, summary: None, index_status: None, index_error: None,
        });
        assert!(result.is_err());
    }
}
