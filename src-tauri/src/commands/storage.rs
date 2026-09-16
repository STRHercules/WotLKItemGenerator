use std::path::PathBuf;

use serde::{Deserialize, Serialize};
use tauri::{AppHandle, State};
use tauri_plugin_opener::OpenerExt;

use crate::storage::{
    db::Database,
    models::{
        AppSettings, IndexSummary, ItemDetail, LibraryQuery, PagedItems, ReportPageRequest,
        ReportRecord, ReportTablePage, RunConfiguration, RunDetail, RunFilter, RunRecord,
        RunStatusUpdate, SourceDriftReport, SourceFingerprint,
    },
    sources::fingerprint_file,
};

fn storage_error(error: impl std::fmt::Display) -> String {
    error.to_string()
}

fn non_empty(value: &str, label: &str) -> Result<(), String> {
    if value.trim().is_empty() {
        Err(format!("{label} must not be empty"))
    } else {
        Ok(())
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct SourcePathRequest {
    pub logical_name: String,
    pub path: String,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct CompletedIndexResult {
    pub library: IndexSummary,
    pub reports: Vec<ReportRecord>,
}

#[tauri::command]
pub fn create_run(
    database: State<'_, Database>,
    config: RunConfiguration,
) -> Result<RunRecord, String> {
    database.create_run(&config).map_err(storage_error)
}

#[tauri::command]
pub fn create_run_with_id(
    database: State<'_, Database>,
    run_id: String,
    config: RunConfiguration,
) -> Result<RunRecord, String> {
    non_empty(&run_id, "run id")?;
    database
        .create_run_with_id(&run_id, &config)
        .map_err(storage_error)
}

#[tauri::command]
pub fn update_run_runtime_metadata(
    database: State<'_, Database>,
    run_id: String,
    seed: String,
    output_dir: String,
) -> Result<(), String> {
    non_empty(&run_id, "run id")?;
    non_empty(&seed, "seed")?;
    non_empty(&output_dir, "output directory")?;
    database
        .update_run_runtime_metadata(&run_id, &seed, &output_dir)
        .map_err(storage_error)
}

#[tauri::command]
pub fn update_run_status(
    database: State<'_, Database>,
    run_id: String,
    update: RunStatusUpdate,
) -> Result<(), String> {
    non_empty(&run_id, "run id")?;
    database
        .update_run_status(&run_id, update)
        .map_err(storage_error)
}

#[tauri::command]
pub fn list_runs(
    database: State<'_, Database>,
    filter: RunFilter,
) -> Result<Vec<RunRecord>, String> {
    database.list_runs(filter).map_err(storage_error)
}

#[tauri::command]
pub fn get_run(database: State<'_, Database>, run_id: String) -> Result<RunDetail, String> {
    non_empty(&run_id, "run id")?;
    database.get_run(&run_id).map_err(storage_error)
}

#[tauri::command]
pub fn search_items(
    database: State<'_, Database>,
    query: LibraryQuery,
) -> Result<PagedItems, String> {
    database.search_items(query).map_err(storage_error)
}

#[tauri::command]
pub fn get_item(
    database: State<'_, Database>,
    run_id: String,
    entry: i64,
) -> Result<ItemDetail, String> {
    non_empty(&run_id, "run id")?;
    database.get_item(&run_id, entry).map_err(storage_error)
}

#[tauri::command]
pub fn index_run_pack(
    database: State<'_, Database>,
    run_id: String,
    output_dir: String,
) -> Result<IndexSummary, String> {
    non_empty(&run_id, "run id")?;
    non_empty(&output_dir, "output directory")?;
    database
        .index_run_pack(&run_id, &PathBuf::from(output_dir))
        .map_err(storage_error)
}

#[tauri::command]
pub fn index_completed_run(
    database: State<'_, Database>,
    run_id: String,
    output_dir: String,
) -> Result<CompletedIndexResult, String> {
    non_empty(&run_id, "run id")?;
    non_empty(&output_dir, "output directory")?;
    let output_dir = PathBuf::from(output_dir);
    let library = database
        .index_run_pack(&run_id, &output_dir)
        .map_err(storage_error)?;
    let reports = database
        .index_reports(&run_id, &output_dir)
        .map_err(storage_error)?;
    Ok(CompletedIndexResult { library, reports })
}

#[tauri::command]
pub fn delete_run_index(database: State<'_, Database>, run_id: String) -> Result<u64, String> {
    non_empty(&run_id, "run id")?;
    database.delete_run_index(&run_id).map_err(storage_error)
}

#[tauri::command]
pub fn rebuild_run_index(
    database: State<'_, Database>,
    run_id: String,
    output_dir: String,
) -> Result<IndexSummary, String> {
    non_empty(&run_id, "run id")?;
    non_empty(&output_dir, "output directory")?;
    database
        .rebuild_run_index(&run_id, &PathBuf::from(output_dir))
        .map_err(storage_error)
}

#[tauri::command]
pub fn index_reports(
    database: State<'_, Database>,
    run_id: String,
    output_dir: String,
) -> Result<Vec<ReportRecord>, String> {
    non_empty(&run_id, "run id")?;
    non_empty(&output_dir, "output directory")?;
    database
        .index_reports(&run_id, &PathBuf::from(output_dir))
        .map_err(storage_error)
}

#[tauri::command]
pub fn list_reports(
    database: State<'_, Database>,
    run_id: String,
) -> Result<Vec<ReportRecord>, String> {
    non_empty(&run_id, "run id")?;
    database.list_reports(&run_id).map_err(storage_error)
}

#[tauri::command]
pub fn read_report_table(
    database: State<'_, Database>,
    run_id: String,
    report_type: String,
    page: ReportPageRequest,
) -> Result<ReportTablePage, String> {
    non_empty(&run_id, "run id")?;
    non_empty(&report_type, "report type")?;
    database
        .read_report_table(&run_id, &report_type, page)
        .map_err(storage_error)
}

#[tauri::command]
pub fn open_report_file(
    app: AppHandle,
    database: State<'_, Database>,
    report_id: i64,
) -> Result<(), String> {
    let report = database.get_report(report_id).map_err(storage_error)?;
    app.opener()
        .open_path(&report.path, None::<&str>)
        .map_err(storage_error)
}

#[tauri::command]
pub fn open_run_output(
    app: AppHandle,
    database: State<'_, Database>,
    run_id: String,
) -> Result<(), String> {
    non_empty(&run_id, "run id")?;
    let run = database.get_run_record(&run_id).map_err(storage_error)?;
    let path = PathBuf::from(&run.output_dir);
    if !path.is_dir() {
        return Err(format!(
            "run output directory does not exist: {}",
            run.output_dir
        ));
    }
    app.opener()
        .open_path(path.to_string_lossy().to_string(), None::<&str>)
        .map_err(storage_error)
}

#[tauri::command]
pub fn get_settings(database: State<'_, Database>) -> Result<AppSettings, String> {
    database.get_settings().map_err(storage_error)
}

#[tauri::command]
pub fn save_settings(database: State<'_, Database>, settings: AppSettings) -> Result<(), String> {
    database.save_settings(&settings).map_err(storage_error)
}

#[tauri::command]
pub fn fingerprint_sources(
    sources: Vec<SourcePathRequest>,
) -> Result<Vec<SourceFingerprint>, String> {
    sources
        .into_iter()
        .map(|source| {
            non_empty(&source.logical_name, "logical source name")?;
            non_empty(&source.path, "source path")?;
            fingerprint_file(source.logical_name, &PathBuf::from(source.path))
                .map_err(storage_error)
        })
        .collect()
}

#[tauri::command]
pub fn save_run_sources(
    database: State<'_, Database>,
    run_id: String,
    sources: Vec<SourceFingerprint>,
) -> Result<(), String> {
    non_empty(&run_id, "run id")?;
    database
        .save_run_sources(&run_id, &sources)
        .map_err(storage_error)
}

#[tauri::command]
pub fn compare_source_drift(
    database: State<'_, Database>,
    run_id: String,
    current: Vec<SourceFingerprint>,
) -> Result<SourceDriftReport, String> {
    non_empty(&run_id, "run id")?;
    database
        .compare_run_sources(&run_id, &current)
        .map_err(storage_error)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn boundary_models_use_camel_case() {
        let request = SourcePathRequest {
            logical_name: "Item.dbc".into(),
            path: "C:/Data/Item.dbc".into(),
        };
        let value = serde_json::to_value(request).unwrap();
        assert_eq!(value["logicalName"], "Item.dbc");
        assert!(value.get("logical_name").is_none());
    }
}
