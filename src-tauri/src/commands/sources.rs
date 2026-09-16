use std::{
    fs,
    path::{Path, PathBuf},
};

use chrono::{DateTime, Utc};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use tauri::{AppHandle, Manager};
use uuid::Uuid;

#[derive(Debug, Clone, Copy)]
pub struct SourceDefinition {
    pub kind: &'static str,
    pub filename: &'static str,
}

pub const REQUIRED_SOURCES: &[SourceDefinition] = &[
    SourceDefinition {
        kind: "DBC",
        filename: "Item.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "ItemSet.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "Spell.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "SpellItemEnchantment.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "Map.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "MapDifficulty.dbc",
    },
    SourceDefinition {
        kind: "DBC",
        filename: "DungeonMap.dbc",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "creature_loot_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "reference_loot_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "item_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "disenchant_loot_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "spell_proc.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "spell_script_names.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "creature.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "creature_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "instance_encounters.sql",
    },
];

pub const OPTIONAL_SOURCES: &[SourceDefinition] = &[
    SourceDefinition {
        kind: "DBC",
        filename: "Item.custom.dbc",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "gameobject.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "gameobject_template.sql",
    },
    SourceDefinition {
        kind: "SQL",
        filename: "gameobject_loot_template.sql",
    },
];

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct SourceScanRequest {
    pub data_dir: Option<String>,
    pub azerothcore_source_root: Option<String>,
    pub output_dir: Option<String>,
    #[serde(default)]
    pub calculate_fingerprints: bool,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourceStatus {
    pub logical_name: String,
    pub kind: String,
    pub required: bool,
    pub path: String,
    pub exists: bool,
    pub size: Option<u64>,
    pub modified_at: Option<String>,
    pub origin: String,
    pub sha256: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourceCacheStatus {
    pub path: String,
    pub exists: bool,
    pub size: Option<u64>,
    pub modified_at: Option<String>,
    pub state: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourceHealthReport {
    pub health: String,
    pub required_found: usize,
    pub required_total: usize,
    pub optional_found: usize,
    pub optional_total: usize,
    pub azerothcore_ready: bool,
    pub azerothcore_path: String,
    pub dbc_ready: bool,
    pub output_writable: bool,
    pub data_directory: String,
    pub data_origin: String,
    pub sources: Vec<SourceStatus>,
    pub cache: SourceCacheStatus,
}

fn app_cache_path(app: &AppHandle) -> Result<PathBuf, String> {
    app.path()
        .app_local_data_dir()
        .map_err(|error| error.to_string())
        .map(|path| path.join("cache").join("source-cache.json.gz"))
}

fn modified_at(metadata: &fs::Metadata) -> Option<String> {
    metadata
        .modified()
        .ok()
        .map(|value| DateTime::<Utc>::from(value).to_rfc3339())
}

fn hash_file(path: &Path) -> Result<String, String> {
    use std::io::Read;
    let mut file = fs::File::open(path).map_err(|error| error.to_string())?;
    let mut hasher = Sha256::new();
    let mut buffer = vec![0_u8; 1024 * 1024];
    loop {
        let count = file.read(&mut buffer).map_err(|error| error.to_string())?;
        if count == 0 {
            break;
        }
        hasher.update(&buffer[..count]);
    }
    Ok(format!("{:x}", hasher.finalize()))
}

fn source_status(
    base: &Path,
    definition: SourceDefinition,
    required: bool,
    origin: &str,
    hash: bool,
) -> SourceStatus {
    let path = base.join(definition.filename);
    let metadata = fs::metadata(&path).ok();
    let exists = metadata.as_ref().is_some_and(|value| value.is_file());
    let status = SourceStatus {
        logical_name: definition.filename.into(),
        kind: definition.kind.into(),
        required,
        path: path.to_string_lossy().to_string(),
        exists,
        size: metadata.as_ref().map(|value| value.len()),
        modified_at: metadata.as_ref().and_then(modified_at),
        origin: origin.into(),
        sha256: if exists && hash {
            hash_file(&path).ok()
        } else {
            None
        },
    };
    status
}

fn check_output_writable(path: Option<&str>) -> bool {
    let Some(raw) = path.filter(|value| !value.trim().is_empty()) else {
        return false;
    };
    let path = PathBuf::from(raw);
    let base = if path.is_dir() {
        path
    } else {
        path.parent().map(Path::to_path_buf).unwrap_or(path)
    };
    if !base.is_dir() {
        return false;
    }
    let probe = base.join(format!(".wotlk-item-forge-write-{}.tmp", Uuid::new_v4()));
    match fs::write(&probe, b"probe") {
        Ok(()) => {
            let _ = fs::remove_file(probe);
            true
        }
        Err(_) => false,
    }
}

fn cache_status(path: PathBuf, state: &str) -> SourceCacheStatus {
    let metadata = fs::metadata(&path).ok();
    SourceCacheStatus {
        path: path.to_string_lossy().to_string(),
        exists: metadata.as_ref().is_some_and(fs::Metadata::is_file),
        size: metadata.as_ref().map(fs::Metadata::len),
        modified_at: metadata.as_ref().and_then(modified_at),
        state: state.into(),
    }
}

#[tauri::command]
pub fn scan_sources(
    app: AppHandle,
    request: SourceScanRequest,
) -> Result<SourceHealthReport, String> {
    let (data_dir, data_origin) = match request
        .data_dir
        .as_deref()
        .filter(|value| !value.trim().is_empty())
    {
        Some(path) => (PathBuf::from(path), "override".to_string()),
        None => {
            let resource = app
                .path()
                .resource_dir()
                .map_err(|error| error.to_string())?;
            (resource.join("Data"), "bundled".to_string())
        }
    };
    let mut sources = Vec::new();
    for definition in REQUIRED_SOURCES.iter().copied() {
        sources.push(source_status(
            &data_dir,
            definition,
            true,
            &data_origin,
            request.calculate_fingerprints,
        ));
    }
    for definition in OPTIONAL_SOURCES.iter().copied() {
        sources.push(source_status(
            &data_dir,
            definition,
            false,
            &data_origin,
            request.calculate_fingerprints,
        ));
    }
    let required_found = sources
        .iter()
        .filter(|source| source.required && source.exists)
        .count();
    let optional_found = sources
        .iter()
        .filter(|source| !source.required && source.exists)
        .count();
    let dbc_ready = sources
        .iter()
        .filter(|source| source.required && source.kind == "DBC")
        .all(|source| source.exists);
    let core_path = request.azerothcore_source_root.unwrap_or_default();
    let core = PathBuf::from(&core_path);
    let azerothcore_ready = !core_path.trim().is_empty()
        && core.is_dir()
        && (core.join("src").is_dir() || core.join("src/server/scripts").is_dir());
    let output_writable = check_output_writable(request.output_dir.as_deref());
    let health = if required_found < REQUIRED_SOURCES.len() || !azerothcore_ready {
        "error"
    } else {
        "healthy"
    };
    let report = SourceHealthReport {
        health: health.into(),
        required_found,
        required_total: REQUIRED_SOURCES.len(),
        optional_found,
        optional_total: OPTIONAL_SOURCES.len(),
        azerothcore_ready,
        azerothcore_path: core_path,
        dbc_ready,
        output_writable,
        data_directory: data_dir.to_string_lossy().to_string(),
        data_origin,
        sources,
        cache: cache_status(app_cache_path(&app)?, "current"),
    };
    Ok(report)
}

#[tauri::command]
pub fn clear_source_cache(app: AppHandle) -> Result<SourceCacheStatus, String> {
    let path = app_cache_path(&app)?;
    if path.exists() {
        fs::remove_file(&path).map_err(|error| error.to_string())?;
    }
    Ok(cache_status(path, "cleared"))
}

#[tauri::command]
pub fn rebuild_source_cache(app: AppHandle) -> Result<SourceCacheStatus, String> {
    let path = app_cache_path(&app)?;
    if path.exists() {
        fs::remove_file(&path).map_err(|error| error.to_string())?;
    }
    Ok(cache_status(path, "rebuild_pending"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn output_writable_probe_cleans_up_after_itself() {
        let dir = std::env::temp_dir().join(format!("wotlk-source-probe-{}", Uuid::new_v4()));
        fs::create_dir_all(&dir).unwrap();
        assert!(check_output_writable(dir.to_str()));
        assert_eq!(fs::read_dir(&dir).unwrap().count(), 0);
        fs::remove_dir_all(dir).ok();
    }
}
