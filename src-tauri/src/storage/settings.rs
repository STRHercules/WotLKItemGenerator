use chrono::Utc;
use rusqlite::params;

use super::{db::Database, models::AppSettings, Result};

const SETTINGS_KEY: &str = "app_settings";

impl Database {
    pub fn get_settings(&self) -> Result<AppSettings> {
        self.with_conn(|connection| {
            let raw = connection.query_row(
                "SELECT value_json FROM settings WHERE key=?1",
                [SETTINGS_KEY],
                |row| row.get::<_, String>(0),
            );
            match raw {
                Ok(raw) => Ok(serde_json::from_str(&raw)?),
                Err(rusqlite::Error::QueryReturnedNoRows) => Ok(AppSettings::default()),
                Err(error) => Err(error.into()),
            }
        })
    }

    pub fn save_settings(&self, settings: &AppSettings) -> Result<()> {
        let raw = serde_json::to_string(settings)?;
        self.with_conn(|connection| {
            connection.execute(
                "INSERT INTO settings(key,value_json,updated_at) VALUES (?1,?2,?3) ON CONFLICT(key) DO UPDATE SET value_json=excluded.value_json, updated_at=excluded.updated_at",
                params![SETTINGS_KEY, raw, Utc::now().to_rfc3339()],
            )?;
            Ok(())
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn settings_default_and_round_trip() {
        let db = Database::open_in_memory().unwrap();
        assert_eq!(db.get_settings().unwrap().default_item_count, 100_000);
        let mut settings = db.get_settings().unwrap();
        settings.default_expansion = "Wrath".into();
        settings.default_item_count = 25_000;
        db.save_settings(&settings).unwrap();
        let saved = db.get_settings().unwrap();
        assert_eq!(saved.default_expansion, "Wrath");
        assert_eq!(saved.default_item_count, 25_000);
    }
}
