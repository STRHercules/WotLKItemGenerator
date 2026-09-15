import type { ForgeConfig } from '../forge/forgeConfig.ts';

export type RunStatusTone = 'success' | 'failure' | 'warning' | 'neutral' | 'active';

const STATUS_LABELS: Record<string, string> = {
  complete: 'Complete',
  failed: 'Failed',
  cancelled: 'Cancelled',
  checking_sources: 'Checking Sources',
  configuring: 'Configuring',
  generating_skeletons: 'Generating Skeletons',
  finalizing_items: 'Finalizing Items',
  validating: 'Validating',
  writing_output: 'Writing Output',
  indexing_library: 'Indexing Library',
};

export function runStatusLabel(status: string): string {
  if (STATUS_LABELS[status]) return STATUS_LABELS[status];
  return status
    .split('_')
    .filter(Boolean)
    .map((part) => part.charAt(0).toUpperCase() + part.slice(1))
    .join(' ') || 'Unknown';
}

export function runStatusTone(status: string): RunStatusTone {
  if (status === 'complete') return 'success';
  if (status === 'failed') return 'failure';
  if (status === 'cancelled') return 'neutral';
  if (status === 'validating' || status === 'indexing_library') return 'warning';
  return 'active';
}

const EXPANSIONS = new Set(['Classic','TBC','Wrath','All']);
const MAGIC_EFFECTS = new Set(['On Hit','On Use','On Equip','None','All']);
const LOOT_DESTINATIONS = new Set(['world','dungeon','raid']);

export function historicalForgeConfig(
  configuration: Record<string, unknown>,
  defaults: ForgeConfig,
): ForgeConfig {
  const restored = { ...defaults, ...configuration } as ForgeConfig;
  if (!Array.isArray(configuration.classes) || configuration.classes.some((item) => typeof item !== 'string')) {
    restored.classes = [...defaults.classes];
  } else {
    restored.classes = [...configuration.classes] as string[];
  }
  if (typeof configuration.expansion !== 'string' || !EXPANSIONS.has(configuration.expansion)) restored.expansion = defaults.expansion;
  if (typeof configuration.magic_effects !== 'string' || !MAGIC_EFFECTS.has(configuration.magic_effects)) restored.magic_effects = defaults.magic_effects;
  if (!Array.isArray(configuration.loot_destinations)) {
    restored.loot_destinations = [...defaults.loot_destinations];
  } else {
    const valid = configuration.loot_destinations.filter((item): item is 'world' | 'dungeon' | 'raid' => typeof item === 'string' && LOOT_DESTINATIONS.has(item));
    restored.loot_destinations = valid.length ? valid : [...defaults.loot_destinations];
  }
  return restored;
}

export function formatDuration(elapsedMs: number | null): string {
  if (elapsedMs == null || !Number.isFinite(elapsedMs) || elapsedMs < 0) return '—';
  const seconds = elapsedMs / 1000;
  const minutes = Math.floor(seconds / 60);
  const remainder = seconds - minutes * 60;
  return `${String(minutes).padStart(2, '0')}:${remainder.toFixed(2).padStart(5, '0')}`;
}
