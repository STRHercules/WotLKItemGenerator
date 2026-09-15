import { forgeDefaultsFromSettings, validateSettings } from './settingsModel.ts';

const base = {
  number: 100000, expansion: 'All', output_root: '', data_dir: null, azerothcore_source_root: null,
  loot_chance: 2, set_rate: .2, set_min_level: 20, set_size: 5,
} as any;
const settings = {
  defaultOutputDirectory: 'D:/Packs', defaultDataDirectory: 'D:/Data', azerothcoreSourceRoot: 'D:/AzerothCore',
  defaultExpansion: 'Wrath', defaultItemCount: 25000, rememberLastForgeConfiguration: true,
  animations: true, density: 'compact', showDiscoveryFeed: true, reduceMotion: false,
  defaultLootChance: 3.5, defaultSetRate: .25, defaultSetMinLevel: 30, defaultSetSize: 6,
} as any;
const result = forgeDefaultsFromSettings(settings, base);
if (result.output_root !== 'D:/Packs') throw new Error('output setting not applied');
if (result.data_dir !== 'D:/Data') throw new Error('data setting not applied');
if (result.azerothcore_source_root !== 'D:/AzerothCore') throw new Error('core setting not applied');
if (result.expansion !== 'Wrath' || result.number !== 25000) throw new Error('general defaults not applied');
if (result.loot_chance !== 3.5 || result.set_rate !== .25 || result.set_min_level !== 30 || result.set_size !== 6) throw new Error('generator defaults not applied');

if (validateSettings(settings).length !== 0) throw new Error('valid settings rejected');
const errors = validateSettings({ ...settings, defaultItemCount: 0, defaultSetSize: 99, density: 'giant' });
if (errors.length !== 3) throw new Error(`expected three validation errors, got ${errors.length}`);
