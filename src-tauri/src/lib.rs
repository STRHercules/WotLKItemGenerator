mod commands;
mod engine;
mod storage;

use engine::process::ProcessRegistry;
use storage::db::Database;
use tauri::Manager;

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_dialog::init())
        .plugin(tauri_plugin_shell::init())
        .plugin(tauri_plugin_opener::init())
        .manage(ProcessRegistry::default())
        .setup(|app| {
            let app_data = app.path().app_local_data_dir()?;
            std::fs::create_dir_all(&app_data)?;
            let database = Database::open(&app_data.join("app.db"))?;
            app.manage(database);
            Ok(())
        })
        .invoke_handler(tauri::generate_handler![
            commands::engine::start_generation,
            commands::engine::cancel_generation,
            commands::engine::generation_active,
            commands::storage::create_run,
            commands::storage::create_run_with_id,
            commands::storage::update_run_status,
            commands::storage::update_run_runtime_metadata,
            commands::storage::list_runs,
            commands::storage::get_run,
            commands::storage::search_items,
            commands::storage::get_item,
            commands::storage::index_run_pack,
            commands::storage::index_completed_run,
            commands::storage::delete_run_index,
            commands::storage::rebuild_run_index,
            commands::storage::index_reports,
            commands::storage::list_reports,
            commands::storage::read_report_table,
            commands::storage::open_report_file,
            commands::storage::open_run_output,
            commands::storage::get_settings,
            commands::storage::save_settings,
            commands::storage::fingerprint_sources,
            commands::storage::save_run_sources,
            commands::storage::compare_source_drift,
            commands::sources::scan_sources,
            commands::sources::clear_source_cache,
            commands::sources::rebuild_source_cache,
        ])
        .run(tauri::generate_context!())
        .expect("error while running WotLK Item Forge");
}
