import type { AppSettings } from '../../types/storage.ts';
import type { ForgeConfig } from '../forge/forgeConfig.ts';

export function forgeDefaultsFromSettings(settings: AppSettings, base: ForgeConfig): ForgeConfig {
  return {
    ...base,
    number: settings.defaultItemCount,
    expansion: settings.defaultExpansion,
    output_root: settings.defaultOutputDirectory,
    data_dir: settings.defaultDataDirectory || null,
    azerothcore_source_root: settings.azerothcoreSourceRoot || null,
    loot_chance: settings.defaultLootChance,
    set_rate: settings.defaultSetRate,
    set_min_level: settings.defaultSetMinLevel,
    set_size: settings.defaultSetSize,
  };
}

export function validateSettings(settings: AppSettings): string[] {
  const errors: string[] = [];
  if (!Number.isInteger(settings.defaultItemCount) || settings.defaultItemCount < 1 || settings.defaultItemCount > 200_000) {
    errors.push('Default item count must be between 1 and 200,000.');
  }
  if (!['Classic','TBC','Wrath','All'].includes(settings.defaultExpansion)) errors.push('Default expansion is invalid.');
  if (!['compact','comfortable'].includes(settings.density)) errors.push('Density must be compact or comfortable.');
  if (!Number.isFinite(settings.defaultLootChance) || settings.defaultLootChance < 0 || settings.defaultLootChance > 100) errors.push('Default loot chance must be 0 to 100%.');
  if (!Number.isFinite(settings.defaultSetRate) || settings.defaultSetRate < 0 || settings.defaultSetRate > 1) errors.push('Default set rate must be 0 to 1.');
  if (!Number.isInteger(settings.defaultSetMinLevel) || settings.defaultSetMinLevel < 1 || settings.defaultSetMinLevel > 80) errors.push('Default set minimum level must be 1 to 80.');
  if (!Number.isInteger(settings.defaultSetSize) || settings.defaultSetSize < 2 || settings.defaultSetSize > 10) errors.push('Default set size must be 2 to 10.');
  return errors;
}
