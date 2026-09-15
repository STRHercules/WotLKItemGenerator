use serde::{Deserialize, Serialize};
use serde_json::json;
use tauri::{AppHandle, Emitter, Manager, State};
use tauri_plugin_shell::{process::CommandEvent, ShellExt};
use uuid::Uuid;

use crate::engine::{
    events::{parse_event_line, EngineEvent, EVENT_PROTOCOL_VERSION},
    process::ProcessRegistry,
};

const ENGINE_SIDECAR: &str = "wotlk-item-forge-engine";

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GenerationRequest {
    pub number: u64,
    pub classes: Vec<String>,
    pub expansion: String,
    pub magic_effects: String,
    #[serde(default)]
    pub loot_destinations: Vec<String>,
    pub generate_sets: bool,
    pub generate_sockets: bool,
    pub generate_socket_bonuses: bool,
    pub generate_legendaries: bool,
    pub generate_disenchant: bool,
    pub seed: Option<String>,
    pub output_root: String,
    pub data_dir: Option<String>,
    pub azerothcore_source_root: Option<String>,
    #[serde(default)]
    pub strict_expansion_scoping: bool,
    #[serde(default = "default_loot_chance")]
    pub loot_chance: f64,
    #[serde(default = "default_set_rate")]
    pub set_rate: f64,
    #[serde(default = "default_set_min_level")]
    pub set_min_level: u64,
    #[serde(default = "default_set_size")]
    pub set_size: u64,
    #[serde(default = "default_multiplier")]
    pub spell_effect_rate_multiplier: f64,
    #[serde(default = "default_multiplier")]
    pub proc_rate_multiplier: f64,
    #[serde(default = "default_multiplier")]
    pub on_use_rate_multiplier: f64,
    #[serde(default = "default_effect_window")]
    pub effect_ilvl_window: u64,
    #[serde(default = "default_full_percent")]
    pub socket_bonus_rate: f64,
    #[serde(default = "default_full_percent")]
    pub disenchant_rate: f64,
    #[serde(default = "default_max_effects")]
    pub max_special_effects: u64,
    #[serde(default)]
    pub verbose_audit: bool,
    pub content_manifest: Option<String>,
    pub quest_template_source: Option<String>,
    pub world_loot_source: Option<String>,
    pub reference_loot_source: Option<String>,
    pub item_template_source: Option<String>,
    #[serde(default)]
    pub item_dbc_sources: Vec<String>,
    pub item_set_dbc_source: Option<String>,
    pub spell_dbc_source: Option<String>,
    pub spell_enchantment_dbc_source: Option<String>,
    pub disenchant_source: Option<String>,
    pub spell_proc_source: Option<String>,
    pub spell_script_names_source: Option<String>,
    pub gameobject_source: Option<String>,
    pub gameobject_template_source: Option<String>,
    pub gameobject_loot_source: Option<String>,
}

fn default_loot_chance() -> f64 { 2.0 }
fn default_set_rate() -> f64 { 0.20 }
fn default_set_min_level() -> u64 { 20 }
fn default_set_size() -> u64 { 5 }
fn default_multiplier() -> f64 { 1.0 }
fn default_effect_window() -> u64 { 15 }
fn default_full_percent() -> f64 { 100.0 }
fn default_max_effects() -> u64 { 1 }

impl GenerationRequest {
    pub fn to_engine_args(&self) -> Vec<String> {
        let mut args = vec![
            "--ui".into(),
            "json".into(),
            "--number".into(),
            self.number.to_string(),
            "--classes".into(),
            self.classes.join(","),
            "--expansion".into(),
            self.expansion.clone(),
            "--magic-effects".into(),
            self.magic_effects.clone(),
            "--output-root".into(),
            self.output_root.clone(),
            "--loot-chance".into(),
            self.loot_chance.to_string(),
            "--set-rate".into(),
            self.set_rate.to_string(),
            "--set-min-level".into(),
            self.set_min_level.to_string(),
            "--set-size".into(),
            self.set_size.to_string(),
            "--spell-effect-rate-multiplier".into(),
            self.spell_effect_rate_multiplier.to_string(),
            "--proc-rate-multiplier".into(),
            self.proc_rate_multiplier.to_string(),
            "--on-use-rate-multiplier".into(),
            self.on_use_rate_multiplier.to_string(),
            "--effect-ilvl-window".into(),
            self.effect_ilvl_window.to_string(),
            "--socket-bonus-rate".into(),
            self.socket_bonus_rate.to_string(),
            "--disenchant-rate".into(),
            self.disenchant_rate.to_string(),
            "--max-special-effects".into(),
            self.max_special_effects.to_string(),
        ];

        args.push("--loot-destinations".into());
        if self.loot_destinations.is_empty() {
            args.push("none".into());
        } else {
            args.extend(self.loot_destinations.iter().cloned());
        }

        if let Some(seed) = &self.seed {
            if !seed.trim().is_empty() {
                args.extend(["--seed".into(), seed.clone()]);
            }
        }
        if let Some(data_dir) = &self.data_dir {
            args.extend(["--data-dir".into(), data_dir.clone()]);
        }
        if let Some(source_root) = &self.azerothcore_source_root {
            args.extend(["--azerothcore-source-root".into(), source_root.clone()]);
        }
        if self.strict_expansion_scoping {
            args.push("--strict-expansion-scoping".into());
        }
        if !self.generate_sockets {
            args.push("--no-sockets".into());
        }
        if !self.generate_legendaries {
            args.push("--no-legendaries".into());
        }
        if self.verbose_audit {
            args.push("--verbose-audit".into());
        }

        let mut disabled = Vec::new();
        if !self.generate_sets {
            disabled.push("sets");
        }
        if !self.generate_disenchant {
            disabled.push("disenchant");
        }
        if !self.generate_socket_bonuses || !self.generate_sockets {
            disabled.push("socket-bonuses");
        }
        if !disabled.is_empty() {
            args.push("--disable".into());
            args.extend(disabled.into_iter().map(str::to_string));
        }

        push_optional(&mut args, "--content-manifest", &self.content_manifest);
        push_optional(&mut args, "--quest-template-source", &self.quest_template_source);
        push_optional(&mut args, "--world-loot-source", &self.world_loot_source);
        push_optional(&mut args, "--reference-loot-source", &self.reference_loot_source);
        push_optional(&mut args, "--item-template-source", &self.item_template_source);
        for source in &self.item_dbc_sources {
            args.extend(["--item-dbc-source".into(), source.clone()]);
        }
        push_optional(&mut args, "--item-set-dbc-source", &self.item_set_dbc_source);
        push_optional(&mut args, "--spell-dbc-source", &self.spell_dbc_source);
        push_optional(
            &mut args,
            "--spell-enchantment-dbc-source",
            &self.spell_enchantment_dbc_source,
        );
        push_optional(&mut args, "--disenchant-source", &self.disenchant_source);
        push_optional(&mut args, "--spell-proc-source", &self.spell_proc_source);
        push_optional(
            &mut args,
            "--spell-script-names-source",
            &self.spell_script_names_source,
        );
        push_optional(&mut args, "--gameobject-source", &self.gameobject_source);
        push_optional(
            &mut args,
            "--gameobject-template-source",
            &self.gameobject_template_source,
        );
        push_optional(
            &mut args,
            "--gameobject-loot-source",
            &self.gameobject_loot_source,
        );
        args
    }
}

fn push_optional(args: &mut Vec<String>, flag: &str, value: &Option<String>) {
    if let Some(value) = value {
        if !value.trim().is_empty() {
            args.extend([flag.to_string(), value.clone()]);
        }
    }
}

#[derive(Debug, Clone, Serialize)]
pub struct RunHandle {
    pub run_id: String,
}

#[derive(Debug, Clone, Serialize)]
struct EngineEventEnvelope {
    run_id: String,
    event: EngineEvent,
}

#[derive(Debug, Clone, Serialize)]
struct EngineStderrEnvelope {
    run_id: String,
    line: String,
}

#[tauri::command]
pub fn start_generation(
    app: AppHandle,
    registry: State<'_, ProcessRegistry>,
    run_id: Option<String>,
    request: GenerationRequest,
) -> Result<RunHandle, String> {
    let run_id = run_id.filter(|value| !value.trim().is_empty()).unwrap_or_else(|| Uuid::new_v4().to_string());
    let mut engine_args = request.to_engine_args();
    let cache_path = app
        .path()
        .app_local_data_dir()
        .map_err(|error| format!("failed to resolve app data directory: {error}"))?
        .join("cache")
        .join("source-cache.json.gz");
    engine_args.extend(["--source-cache-file".into(), cache_path.to_string_lossy().to_string()]);
    let command = app
        .shell()
        .sidecar(ENGINE_SIDECAR)
        .map_err(|error| format!("failed to resolve generator sidecar: {error}"))?
        .args(engine_args);
    let (mut receiver, child) = command
        .spawn()
        .map_err(|error| format!("failed to launch generator sidecar: {error}"))?;

    registry.insert(run_id.clone(), child)?;
    let registry_for_task = registry.inner().clone();
    let app_for_task = app.clone();
    let run_for_task = run_id.clone();

    tauri::async_runtime::spawn(async move {
        let mut saw_terminal_event = false;
        while let Some(command_event) = receiver.recv().await {
            match command_event {
                CommandEvent::Stdout(bytes) => {
                    let line = String::from_utf8_lossy(&bytes).trim().to_string();
                    if line.is_empty() {
                        continue;
                    }
                    match parse_event_line(&line) {
                        Ok(event) => {
                            saw_terminal_event |= event.is_complete() || event.is_error();
                            let _ = app_for_task.emit(
                                "engine://event",
                                EngineEventEnvelope {
                                    run_id: run_for_task.clone(),
                                    event,
                                },
                            );
                        }
                        Err(error) => {
                            let _ = app_for_task.emit(
                                "engine://stderr",
                                EngineStderrEnvelope {
                                    run_id: run_for_task.clone(),
                                    line: format!("{error}; raw stdout: {line}"),
                                },
                            );
                        }
                    }
                }
                CommandEvent::Stderr(bytes) => {
                    let line = String::from_utf8_lossy(&bytes).trim().to_string();
                    if !line.is_empty() {
                        let _ = app_for_task.emit(
                            "engine://stderr",
                            EngineStderrEnvelope {
                                run_id: run_for_task.clone(),
                                line,
                            },
                        );
                    }
                }
                CommandEvent::Error(message) => {
                    let _ = app_for_task.emit(
                        "engine://stderr",
                        EngineStderrEnvelope {
                            run_id: run_for_task.clone(),
                            line: message.clone(),
                        },
                    );
                    if !saw_terminal_event {
                        saw_terminal_event = true;
                        let _ = app_for_task.emit(
                            "engine://event",
                            EngineEventEnvelope {
                                run_id: run_for_task.clone(),
                                event: EngineEvent::Error {
                                    protocol_version: EVENT_PROTOCOL_VERSION,
                                    stage: Some("process".into()),
                                    message,
                                    details: None,
                                },
                            },
                        );
                    }
                }
                CommandEvent::Terminated(payload) => {
                    let was_cancelled = registry_for_task.take_cancelled(&run_for_task).unwrap_or(false);
                    let _ = registry_for_task.remove(&run_for_task);
                    if payload.code.unwrap_or(-1) != 0 && !saw_terminal_event && !was_cancelled {
                        let _ = app_for_task.emit(
                            "engine://event",
                            EngineEventEnvelope {
                                run_id: run_for_task.clone(),
                                event: EngineEvent::Error {
                                    protocol_version: EVENT_PROTOCOL_VERSION,
                                    stage: Some("process".into()),
                                    message: format!(
                                        "generator exited with code {}",
                                        payload.code.unwrap_or(-1)
                                    ),
                                    details: Some(json!({ "signal": payload.signal })),
                                },
                            },
                        );
                    }
                    break;
                }
                _ => {}
            }
        }
        let _ = registry_for_task.remove(&run_for_task);
        let _ = registry_for_task.take_cancelled(&run_for_task);
    });

    Ok(RunHandle { run_id })
}

#[tauri::command]
pub fn cancel_generation(
    registry: State<'_, ProcessRegistry>,
    run_id: String,
) -> Result<(), String> {
    registry.cancel(&run_id)
}

#[tauri::command]
pub fn generation_active(
    registry: State<'_, ProcessRegistry>,
    run_id: String,
) -> Result<bool, String> {
    registry.contains(&run_id)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn request() -> GenerationRequest {
        GenerationRequest {
            number: 100,
            classes: vec!["Mage".into(), "Druid".into()],
            expansion: "Wrath".into(),
            magic_effects: "All".into(),
            loot_destinations: vec!["world".into(), "raid".into()],
            generate_sets: false,
            generate_sockets: true,
            generate_socket_bonuses: true,
            generate_legendaries: false,
            generate_disenchant: true,
            seed: Some("123456".into()),
            output_root: "C:/Packs".into(),
            data_dir: Some("C:/Data".into()),
            azerothcore_source_root: Some("C:/AzerothCore".into()),
            strict_expansion_scoping: true,
            loot_chance: 2.0,
            set_rate: 0.2,
            set_min_level: 20,
            set_size: 5,
            spell_effect_rate_multiplier: 1.0,
            proc_rate_multiplier: 1.0,
            on_use_rate_multiplier: 1.0,
            effect_ilvl_window: 15,
            socket_bonus_rate: 100.0,
            disenchant_rate: 100.0,
            max_special_effects: 1,
            verbose_audit: false,
            content_manifest: None,
            quest_template_source: None,
            world_loot_source: None,
            reference_loot_source: None,
            item_template_source: None,
            item_dbc_sources: Vec::new(),
            item_set_dbc_source: None,
            spell_dbc_source: None,
            spell_enchantment_dbc_source: None,
            disenchant_source: None,
            spell_proc_source: None,
            spell_script_names_source: None,
            gameobject_source: None,
            gameobject_template_source: None,
            gameobject_loot_source: None,
        }
    }

    #[test]
    fn request_maps_gui_controls_to_engine_flags() {
        let args = request().to_engine_args();
        assert!(args.windows(2).any(|pair| pair == ["--classes", "Mage,Druid"]));
        assert!(args.windows(2).any(|pair| pair == ["--loot-destinations", "world"]));
        assert!(args.iter().any(|value| value == "raid"));
        assert!(args.iter().any(|value| value == "--no-legendaries"));
        assert!(args.iter().any(|value| value == "sets"));
        assert!(args.windows(2).any(|pair| pair == ["--seed", "123456"]));
    }
}
