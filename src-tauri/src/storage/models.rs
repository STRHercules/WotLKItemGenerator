use serde::{Deserialize, Serialize};
use serde_json::Value;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RunConfiguration {
    pub seed: String,
    pub output_dir: String,
    pub engine_version: String,
    pub protocol_version: u32,
    pub expansion: String,
    pub item_count: u64,
    pub classes: Vec<String>,
    pub config: Value,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RunRecord {
    pub id: String,
    pub seed: String,
    pub status: String,
    pub started_at: String,
    pub finished_at: Option<String>,
    pub elapsed_ms: Option<i64>,
    pub output_dir: String,
    pub engine_version: String,
    pub protocol_version: u32,
    pub validation_error_count: i64,
    pub summary: Value,
    pub index_status: String,
    pub index_error: Option<String>,
    pub expansion: String,
    pub item_count: u64,
    pub classes: Vec<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RunDetail {
    #[serde(flatten)]
    pub run: RunRecord,
    pub configuration: Value,
    pub sources: Vec<SourceFingerprint>,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct RunFilter {
    pub status: Option<String>,
    pub expansion: Option<String>,
    pub search: Option<String>,
    pub limit: Option<u32>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct RunStatusUpdate {
    pub status: String,
    pub finished_at: Option<String>,
    pub elapsed_ms: Option<i64>,
    pub validation_error_count: Option<i64>,
    pub summary: Option<Value>,
    pub index_status: Option<String>,
    pub index_error: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct IndexSummary {
    pub run_id: String,
    pub item_count: u64,
    pub effect_count: u64,
    pub socket_count: u64,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct LibraryQuery {
    pub text: Option<String>,
    pub run_id: Option<String>,
    pub seed: Option<String>,
    pub class_name: Option<String>,
    pub role: Option<String>,
    pub quality: Option<i64>,
    pub kind: Option<String>,
    pub required_level_min: Option<i64>,
    pub required_level_max: Option<i64>,
    pub item_level_min: Option<i64>,
    pub item_level_max: Option<i64>,
    pub itemset: Option<i64>,
    pub effect_type: Option<String>,
    pub minimum_socket_count: Option<i64>,
    pub placement_type: Option<String>,
    pub entry: Option<i64>,
    pub sort: Option<String>,
    pub limit: Option<u32>,
    pub offset: Option<u32>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemSummary {
    pub run_id: String,
    pub entry: i64,
    pub name: String,
    pub class_name: Option<String>,
    pub role: Option<String>,
    pub quality: Option<i64>,
    pub required_level: Option<i64>,
    pub item_level: Option<i64>,
    pub kind: Option<String>,
    pub itemset: Option<i64>,
    pub set_name: Option<String>,
    pub special_effect_feature: Option<String>,
    pub socket_count: i64,
    pub seed: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PagedItems {
    pub items: Vec<ItemSummary>,
    pub total: u64,
    pub limit: u32,
    pub offset: u32,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemEffect {
    pub slot: i64,
    pub spell_id: Option<i64>,
    pub trigger: Option<i64>,
    pub charges: Option<i64>,
    pub ppm_rate: Option<f64>,
    pub cooldown: Option<i64>,
    pub category: Option<i64>,
    pub category_cooldown: Option<i64>,
    pub raw: Value,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemPlacement {
    pub destination: String,
    pub profile_id: Option<String>,
    pub map_id: Option<i64>,
    pub difficulty_id: Option<i64>,
    pub instance: Option<String>,
    pub encounter: Option<String>,
    pub pool_id: Option<i64>,
    pub chance: Option<f64>,
    pub raw: Value,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ItemDetail {
    #[serde(flatten)]
    pub item: ItemSummary,
    pub raw: Value,
    pub effects: Vec<ItemEffect>,
    pub sockets: Vec<i64>,
    pub placements: Vec<ItemPlacement>,
    pub run: RunRecord,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ReportRecord {
    pub id: i64,
    pub run_id: String,
    pub report_type: String,
    pub path: String,
    pub import_state: String,
    pub size: u64,
    pub modified_at: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize, Default)]
#[serde(rename_all = "camelCase")]
pub struct ReportPageRequest {
    pub offset: Option<u32>,
    pub limit: Option<u32>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct ReportTablePage {
    pub report_type: String,
    pub headers: Vec<String>,
    pub rows: Vec<Vec<String>>,
    pub offset: u32,
    pub limit: u32,
    pub has_more: bool,
    pub raw_json: Option<Value>,
}

#[derive(Debug, Clone, Serialize, Deserialize, PartialEq, Eq)]
#[serde(rename_all = "camelCase")]
pub struct SourceFingerprint {
    pub logical_name: String,
    pub path: String,
    pub sha256: String,
    pub size: u64,
    pub modified_at: Option<String>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourceDriftEntry {
    pub logical_name: String,
    pub path: String,
    pub status: String,
    pub previous: Option<SourceFingerprint>,
    pub current: Option<SourceFingerprint>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourceDriftReport {
    pub changed: bool,
    pub entries: Vec<SourceDriftEntry>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(default, rename_all = "camelCase")]
pub struct AppSettings {
    pub default_output_directory: String,
    pub default_data_directory: String,
    pub azerothcore_source_root: String,
    pub default_expansion: String,
    pub default_item_count: u64,
    pub remember_last_forge_configuration: bool,
    pub animations: bool,
    pub density: String,
    pub show_discovery_feed: bool,
    pub reduce_motion: bool,
    pub default_loot_chance: f64,
    pub default_set_rate: f64,
    pub default_set_min_level: u64,
    pub default_set_size: u64,
}

impl Default for AppSettings {
    fn default() -> Self {
        Self {
            default_output_directory: String::new(),
            default_data_directory: String::new(),
            azerothcore_source_root: String::new(),
            default_expansion: "All".into(),
            default_item_count: 100_000,
            remember_last_forge_configuration: true,
            animations: true,
            density: "comfortable".into(),
            show_discovery_feed: true,
            reduce_motion: false,
            default_loot_chance: 2.0,
            default_set_rate: 0.20,
            default_set_min_level: 20,
            default_set_size: 5,
        }
    }
}
