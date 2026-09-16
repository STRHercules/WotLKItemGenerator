use std::{collections::BTreeMap, fs::File, io::Read, path::Path};

use chrono::{DateTime, Utc};
use rusqlite::params;
use sha2::{Digest, Sha256};

use super::{
    db::Database,
    models::{SourceDriftEntry, SourceDriftReport, SourceFingerprint},
    Result,
};

impl Database {
    pub fn save_run_sources(&self, run_id: &str, sources: &[SourceFingerprint]) -> Result<()> {
        self.get_run_record(run_id)?;
        self.with_conn_mut(|connection| {
            let transaction = connection.transaction()?;
            transaction.execute("DELETE FROM run_sources WHERE run_id=?1", [run_id])?;
            for source in sources {
                transaction.execute(
                    "INSERT INTO run_sources(run_id,logical_name,path,sha256,size,modified_at) VALUES (?1,?2,?3,?4,?5,?6)",
                    params![run_id, source.logical_name, source.path, source.sha256, source.size as i64, source.modified_at],
                )?;
            }
            transaction.commit()?;
            Ok(())
        })
    }

    pub fn list_run_sources(&self, run_id: &str) -> Result<Vec<SourceFingerprint>> {
        self.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT logical_name,path,sha256,size,modified_at FROM run_sources WHERE run_id=?1 ORDER BY logical_name,path")?;
            let rows = statement.query_map([run_id], |row| Ok(SourceFingerprint { logical_name: row.get(0)?, path: row.get(1)?, sha256: row.get(2)?, size: row.get::<_, i64>(3)? as u64, modified_at: row.get(4)? }))?.collect::<std::result::Result<Vec<_>, _>>()?;
            Ok(rows)
        })
    }

    pub fn compare_run_sources(
        &self,
        run_id: &str,
        current: &[SourceFingerprint],
    ) -> Result<SourceDriftReport> {
        let previous = self.list_run_sources(run_id)?;
        let previous_map = previous
            .into_iter()
            .map(|item| ((item.logical_name.clone(), item.path.clone()), item))
            .collect::<BTreeMap<_, _>>();
        let current_map = current
            .iter()
            .cloned()
            .map(|item| ((item.logical_name.clone(), item.path.clone()), item))
            .collect::<BTreeMap<_, _>>();
        let mut keys = previous_map
            .keys()
            .chain(current_map.keys())
            .cloned()
            .collect::<Vec<_>>();
        keys.sort();
        keys.dedup();
        let mut entries = Vec::new();
        for key in keys {
            let old = previous_map.get(&key).cloned();
            let now = current_map.get(&key).cloned();
            let status = match (&old, &now) {
                (Some(a), Some(b)) if a.sha256 == b.sha256 => "unchanged",
                (Some(_), Some(_)) => "modified",
                (Some(_), None) => "missing",
                (None, Some(_)) => "new",
                (None, None) => continue,
            };
            entries.push(SourceDriftEntry {
                logical_name: key.0,
                path: key.1,
                status: status.into(),
                previous: old,
                current: now,
            });
        }
        let changed = entries.iter().any(|entry| entry.status != "unchanged");
        Ok(SourceDriftReport { changed, entries })
    }
}

pub fn fingerprint_file(logical_name: impl Into<String>, path: &Path) -> Result<SourceFingerprint> {
    let metadata = std::fs::metadata(path)?;
    let mut file = File::open(path)?;
    let mut hasher = Sha256::new();
    let mut buffer = vec![0_u8; 1024 * 1024];
    loop {
        let count = file.read(&mut buffer)?;
        if count == 0 {
            break;
        }
        hasher.update(&buffer[..count]);
    }
    let modified_at = metadata
        .modified()
        .ok()
        .map(|value| DateTime::<Utc>::from(value).to_rfc3339());
    Ok(SourceFingerprint {
        logical_name: logical_name.into(),
        path: path.to_string_lossy().to_string(),
        sha256: format!("{:x}", hasher.finalize()),
        size: metadata.len(),
        modified_at,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::storage::models::RunConfiguration;
    use serde_json::json;

    #[test]
    fn source_drift_reports_modified_missing_and_new() {
        let db = Database::open_in_memory().unwrap();
        let run = db
            .create_run(&RunConfiguration {
                seed: "1".into(),
                output_dir: "x".into(),
                engine_version: "test".into(),
                protocol_version: 1,
                expansion: "All".into(),
                item_count: 1,
                classes: vec![],
                config: json!({}),
            })
            .unwrap();
        db.save_run_sources(
            &run.id,
            &[
                SourceFingerprint {
                    logical_name: "Item.dbc".into(),
                    path: "A".into(),
                    sha256: "old".into(),
                    size: 1,
                    modified_at: None,
                },
                SourceFingerprint {
                    logical_name: "Spell.dbc".into(),
                    path: "B".into(),
                    sha256: "same".into(),
                    size: 1,
                    modified_at: None,
                },
                SourceFingerprint {
                    logical_name: "Map.dbc".into(),
                    path: "D".into(),
                    sha256: "gone".into(),
                    size: 1,
                    modified_at: None,
                },
            ],
        )
        .unwrap();
        let report = db
            .compare_run_sources(
                &run.id,
                &[
                    SourceFingerprint {
                        logical_name: "Item.dbc".into(),
                        path: "A".into(),
                        sha256: "new".into(),
                        size: 1,
                        modified_at: None,
                    },
                    SourceFingerprint {
                        logical_name: "Spell.dbc".into(),
                        path: "B".into(),
                        sha256: "same".into(),
                        size: 1,
                        modified_at: None,
                    },
                    SourceFingerprint {
                        logical_name: "Map.dbc".into(),
                        path: "C".into(),
                        sha256: "map".into(),
                        size: 1,
                        modified_at: None,
                    },
                ],
            )
            .unwrap();
        assert!(report.changed);
        assert!(report
            .entries
            .iter()
            .any(|entry| entry.status == "modified"));
        assert!(report.entries.iter().any(|entry| entry.status == "new"));
        assert!(report.entries.iter().any(|entry| entry.status == "missing"));
        assert!(report
            .entries
            .iter()
            .any(|entry| entry.status == "unchanged"));
    }
}
