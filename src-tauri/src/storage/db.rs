use std::{path::Path, sync::{Arc, Mutex}};

use rusqlite::{Connection, OptionalExtension};

use super::{map_poison, Result, StorageError};

const SCHEMA_VERSION: i64 = 1;
const MIGRATION_001: &str = include_str!("../../migrations/001_init.sql");

#[derive(Clone)]
pub struct Database {
    connection: Arc<Mutex<Connection>>,
}

impl Database {
    pub fn open(path: &Path) -> Result<Self> {
        if let Some(parent) = path.parent() {
            std::fs::create_dir_all(parent)?;
        }
        let connection = Connection::open(path)?;
        connection.execute_batch("PRAGMA foreign_keys=ON; PRAGMA journal_mode=WAL;")?;
        Self::from_connection(connection)
    }

    pub fn open_in_memory() -> Result<Self> {
        let connection = Connection::open_in_memory()?;
        connection.execute_batch("PRAGMA foreign_keys=ON;")?;
        Self::from_connection(connection)
    }

    fn from_connection(connection: Connection) -> Result<Self> {
        let database = Self {
            connection: Arc::new(Mutex::new(connection)),
        };
        database.run_migrations()?;
        Ok(database)
    }

    fn run_migrations(&self) -> Result<()> {
        let mut connection = self.connection.lock().map_err(map_poison)?;
        let has_meta: bool = connection
            .query_row(
                "SELECT 1 FROM sqlite_master WHERE type='table' AND name='schema_meta'",
                [],
                |_| Ok(true),
            )
            .optional()?
            .unwrap_or(false);
        let current = if has_meta {
            connection
                .query_row("SELECT MAX(version) FROM schema_meta", [], |row| row.get::<_, Option<i64>>(0))?
                .unwrap_or(0)
        } else {
            0
        };
        if current > SCHEMA_VERSION {
            return Err(StorageError::SchemaTooNew {
                found: current,
                supported: SCHEMA_VERSION,
            });
        }
        if current < 1 {
            connection.execute_batch(MIGRATION_001)?;
        }
        Ok(())
    }

    pub fn schema_version(&self) -> Result<i64> {
        self.with_conn(|connection| {
            Ok(connection.query_row("SELECT MAX(version) FROM schema_meta", [], |row| row.get(0))?)
        })
    }

    pub(crate) fn with_conn<T>(&self, f: impl FnOnce(&Connection) -> Result<T>) -> Result<T> {
        let connection = self.connection.lock().map_err(map_poison)?;
        f(&connection)
    }

    pub(crate) fn with_conn_mut<T>(&self, f: impl FnOnce(&mut Connection) -> Result<T>) -> Result<T> {
        let mut connection = self.connection.lock().map_err(map_poison)?;
        f(&mut connection)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn migration_creates_schema() {
        let db = Database::open_in_memory().unwrap();
        let tables = db.with_conn(|connection| {
            let mut statement = connection.prepare("SELECT name FROM sqlite_master WHERE type='table'")?;
            let names = statement
                .query_map([], |row| row.get::<_, String>(0))?
                .collect::<std::result::Result<Vec<_>, _>>()?;
            Ok(names)
        }).unwrap();
        for expected in [
            "runs", "run_configuration", "run_sources", "generated_items", "item_effects",
            "item_sockets", "item_placements", "report_index", "settings",
        ] {
            assert!(tables.iter().any(|name| name == expected), "missing {expected}");
        }
        assert_eq!(db.schema_version().unwrap(), 1);
    }
}
