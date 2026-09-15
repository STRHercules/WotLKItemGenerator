import { canBeginForging, defaultForgeConfig, effectiveItemMaximum } from './forgeConfig.ts';

const config = defaultForgeConfig();
if (config.classes.length !== 10 || config.number !== 100_000) throw new Error('forge defaults are wrong');
if (effectiveItemMaximum(['Paladin']) !== 20_000) throw new Error('single-class max must be 20k');
if (effectiveItemMaximum(config.classes) !== 200_000) throw new Error('all-class max must be 200k');

const ready = {
  requiredSourcesFound: 16,
  requiredSourcesTotal: 16,
  azerothcoreReady: true,
  dbcReady: true,
  outputWritable: true,
  blockingMessages: [],
};
const configured = { ...config, output_root: 'C:/Packs' };
if (!canBeginForging(ready, configured)) throw new Error('ready config should forge');
if (canBeginForging({ ...ready, dbcReady: false }, configured)) throw new Error('missing DBC health must block');
if (canBeginForging(ready, { ...configured, classes: [] })) throw new Error('zero classes must block');
