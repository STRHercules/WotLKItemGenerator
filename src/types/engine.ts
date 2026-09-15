export const ENGINE_EVENT_PROTOCOL_VERSION = 1 as const;

export type EngineEventBase = {
  protocol_version: typeof ENGINE_EVENT_PROTOCOL_VERSION;
};

export type ConfiguredEvent = EngineEventBase & {
  type: 'configured';
  seed: string;
  number: number;
  source?: string;
  output_dir?: string;
  classes?: string[];
  class_counts?: Record<string, number>;
  expansion?: string;
  magic_effects?: string;
  loot_destinations?: string[];
  disabled_features?: string[];
  [key: string]: unknown;
};

export type PhaseEvent = EngineEventBase & {
  type: 'phase';
  name: string;
  detail?: string;
  total?: number | null;
};

export type ProgressEvent = EngineEventBase & {
  type: 'progress';
  completed: number;
  total: number;
  current?: string;
  class_name?: string | null;
  class_completed?: number | null;
  class_total?: number | null;
};

export type StatusEvent = EngineEventBase & {
  type: 'status';
  message: string;
};

export type DiscoveryEvent = EngineEventBase & {
  type: 'discovery';
  kind: string;
  title: string;
  detail?: string;
};

export type SourceCheckEvent = EngineEventBase & {
  type: 'source_check';
  label: string;
  path: string;
  ok: boolean;
};

export type ValidationEvent = EngineEventBase & {
  type: 'validation';
  error_count: number;
  errors: string[];
  name_repair_count: number;
  name_repairs: unknown[];
};

export type CompleteEvent = EngineEventBase & {
  type: 'complete';
  report: Record<string, unknown>;
  elapsed: number;
  output_dir: string;
};

export type ErrorEvent = EngineEventBase & {
  type: 'error';
  stage?: string | null;
  message: string;
  details?: unknown;
};

export type EngineEvent =
  | ConfiguredEvent
  | PhaseEvent
  | ProgressEvent
  | StatusEvent
  | DiscoveryEvent
  | SourceCheckEvent
  | ValidationEvent
  | CompleteEvent
  | ErrorEvent;

export type EngineEventEnvelope = {
  run_id: string;
  event: EngineEvent;
};

export type EngineStderrEnvelope = {
  run_id: string;
  line: string;
};

export type RunHandle = {
  run_id: string;
};

export type GenerationRequest = {
  number: number;
  classes: string[];
  expansion: 'Classic' | 'TBC' | 'Wrath' | 'All';
  magic_effects: 'On Hit' | 'On Use' | 'On Equip' | 'None' | 'All';
  loot_destinations: Array<'world' | 'dungeon' | 'raid'>;
  generate_sets: boolean;
  generate_sockets: boolean;
  generate_socket_bonuses: boolean;
  generate_legendaries: boolean;
  generate_disenchant: boolean;
  seed: string | null;
  output_root: string;
  data_dir: string | null;
  azerothcore_source_root: string | null;
  strict_expansion_scoping: boolean;
  loot_chance: number;
  set_rate: number;
  set_min_level: number;
  set_size: number;
  spell_effect_rate_multiplier: number;
  proc_rate_multiplier: number;
  on_use_rate_multiplier: number;
  effect_ilvl_window: number;
  socket_bonus_rate: number;
  disenchant_rate: number;
  max_special_effects: number;
  verbose_audit: boolean;
  content_manifest: string | null;
  quest_template_source: string | null;
  world_loot_source: string | null;
  reference_loot_source: string | null;
  item_template_source: string | null;
  item_dbc_sources: string[];
  item_set_dbc_source: string | null;
  spell_dbc_source: string | null;
  spell_enchantment_dbc_source: string | null;
  disenchant_source: string | null;
  spell_proc_source: string | null;
  spell_script_names_source: string | null;
  gameobject_source: string | null;
  gameobject_template_source: string | null;
  gameobject_loot_source: string | null;
};
