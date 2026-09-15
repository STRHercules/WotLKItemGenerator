pub mod db;
pub mod library;
pub mod models;
pub mod reports;
pub mod runs;
pub mod settings;
pub mod sources;

use std::sync::{MutexGuard, PoisonError};

#[derive(Debug, thiserror::Error)]
pub enum StorageError {
    #[error("database error: {0}")]
    Sqlite(#[from] rusqlite::Error),
    #[error("I/O error: {0}")]
    Io(#[from] std::io::Error),
    #[error("JSON error: {0}")]
    Json(#[from] serde_json::Error),
    #[error("CSV error: {0}")]
    Csv(#[from] csv::Error),
    #[error("run not found: {0}")]
    RunNotFound(String),
    #[error("item not found: run={run_id}, entry={entry}")]
    ItemNotFound { run_id: String, entry: i64 },
    #[error("run is already indexed: {0}")]
    AlreadyIndexed(String),
    #[error("invalid run state transition: {from} -> {to}")]
    InvalidRunTransition { from: String, to: String },
    #[error("database schema version {found} is newer than supported version {supported}")]
    SchemaTooNew { found: i64, supported: i64 },
    #[error("storage lock is poisoned")]
    PoisonedLock,
    #[error("invalid storage input: {0}")]
    InvalidInput(String),
}

pub type Result<T> = std::result::Result<T, StorageError>;

pub(crate) fn map_poison<T>(_: PoisonError<MutexGuard<'_, T>>) -> StorageError {
    StorageError::PoisonedLock
}
