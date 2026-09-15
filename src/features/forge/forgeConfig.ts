import type { GenerationRequest } from '../../types/engine';

export const FORGE_CLASSES = [
  'Warrior', 'Paladin', 'Hunter', 'Rogue', 'Priest',
  'Death Knight', 'Shaman', 'Mage', 'Warlock', 'Druid',
] as const;

export type ReadinessState = {
  requiredSourcesFound: number;
  requiredSourcesTotal: number;
  azerothcoreReady: boolean;
  dbcReady: boolean;
  outputWritable: boolean;
  blockingMessages: string[];
};

export type ForgeConfig = GenerationRequest;

export function defaultForgeConfig(): ForgeConfig {
  return {
    number: 100_000,
    classes: [...FORGE_CLASSES],
    expansion: 'All',
    magic_effects: 'All',
    loot_destinations: ['world', 'dungeon', 'raid'],
    generate_sets: true,
    generate_sockets: true,
    generate_socket_bonuses: true,
    generate_legendaries: true,
    generate_disenchant: true,
    seed: null,
    output_root: '',
    data_dir: null,
    azerothcore_source_root: null,
    strict_expansion_scoping: false,
    loot_chance: 2,
    set_rate: 0.2,
    set_min_level: 20,
    set_size: 5,
    spell_effect_rate_multiplier: 1,
    proc_rate_multiplier: 1,
    on_use_rate_multiplier: 1,
    effect_ilvl_window: 15,
    socket_bonus_rate: 100,
    disenchant_rate: 100,
    max_special_effects: 1,
    verbose_audit: false,
    content_manifest: null,
    quest_template_source: null,
    world_loot_source: null,
    reference_loot_source: null,
    item_template_source: null,
    item_dbc_sources: [],
    item_set_dbc_source: null,
    spell_dbc_source: null,
    spell_enchantment_dbc_source: null,
    disenchant_source: null,
    spell_proc_source: null,
    spell_script_names_source: null,
    gameobject_source: null,
    gameobject_template_source: null,
    gameobject_loot_source: null,
  };
}

export function effectiveItemMaximum(classes: string[]): number {
  return Math.min(200_000, Math.max(0, classes.length) * 20_000);
}

export function forgeConfigErrors(config: ForgeConfig): string[] {
  const errors: string[] = [];
  const maxItems = effectiveItemMaximum(config.classes);
  if (config.classes.length === 0) errors.push('Select at least one class.');
  if (!Number.isInteger(config.number) || config.number < 1 || config.number > maxItems) {
    errors.push(`Item count must be between 1 and ${maxItems.toLocaleString()}.`);
  }
  if (!config.output_root.trim()) errors.push('Choose an output folder.');
  if (config.loot_chance < 0 || config.loot_chance > 100) errors.push('Loot chance must be 0 to 100%.');
  if (config.set_rate < 0 || config.set_rate > 1) errors.push('Set rate must be 0 to 1.');
  if (config.set_size < 2 || config.set_size > 10) errors.push('Set size must be 2 to 10.');
  if (config.set_min_level < 1 || config.set_min_level > 80) errors.push('Set minimum level must be 1 to 80.');
  if (config.effect_ilvl_window < 0 || config.effect_ilvl_window > 284) errors.push('Effect item-level window is invalid.');
  if (config.max_special_effects < 0 || config.max_special_effects > 5) errors.push('Maximum special effects must be 0 to 5.');
  for (const [label, value] of [
    ['Spell effect multiplier', config.spell_effect_rate_multiplier],
    ['Proc multiplier', config.proc_rate_multiplier],
    ['On-use multiplier', config.on_use_rate_multiplier],
  ] as const) {
    if (!Number.isFinite(value) || value < 0 || value > 10) errors.push(`${label} must be between 0 and 10.`);
  }
  for (const [label, value] of [
    ['Socket bonus rate', config.socket_bonus_rate],
    ['Disenchant rate', config.disenchant_rate],
  ] as const) {
    if (value < 0 || value > 100) errors.push(`${label} must be 0 to 100%.`);
  }
  return errors;
}

export function canBeginForging(readiness: ReadinessState, config: ForgeConfig): boolean {
  return readiness.requiredSourcesFound >= readiness.requiredSourcesTotal
    && readiness.azerothcoreReady
    && readiness.dbcReady
    && readiness.outputWritable
    && readiness.blockingMessages.length === 0
    && forgeConfigErrors(config).length === 0;
}
