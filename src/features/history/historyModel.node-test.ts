import { historicalForgeConfig, runStatusLabel, runStatusTone } from './historyModel.ts';

const defaults = { number: 100000, classes: ['Warrior'], expansion: 'All', output_root: '', generate_legendaries: true, seed: null, magic_effects: 'All', loot_destinations: ['world','dungeon','raid'] } as any;
const config = historicalForgeConfig({
  number: 24000,
  classes: ['Mage', 'Priest'],
  expansion: 'Wrath',
  output_root: 'D:/Packs',
  generate_legendaries: false,
  seed: '1234567890',
}, defaults);
if (config.number !== 24000) throw new Error('historical item count was not restored');
if (config.classes.join(',') !== 'Mage,Priest') throw new Error('historical classes were not restored');
if (config.expansion !== 'Wrath') throw new Error('historical expansion was not restored');
if (config.output_root !== 'D:/Packs') throw new Error('historical output root was not restored');
if (config.generate_legendaries !== false) throw new Error('historical feature flags were not restored');
if (config.seed !== '1234567890') throw new Error('historical seed was not restored');
if (config.magic_effects !== 'All') throw new Error('missing historical values must fall back to safe Forge defaults');

if (runStatusLabel('complete') !== 'Complete') throw new Error('complete label wrong');
if (runStatusLabel('cancelled') !== 'Cancelled') throw new Error('cancelled label wrong');
if (runStatusLabel('generating_skeletons') !== 'Generating Skeletons') throw new Error('fallback label wrong');
if (runStatusTone('complete') !== 'success') throw new Error('complete tone wrong');
if (runStatusTone('failed') !== 'failure') throw new Error('failed tone wrong');
if (runStatusTone('cancelled') !== 'neutral') throw new Error('cancelled tone wrong');

const sanitized = historicalForgeConfig({ expansion:'Cataclysm', magic_effects:'Everywhere', loot_destinations:['world','moon'] }, defaults);
if (sanitized.expansion !== 'All') throw new Error('invalid historical expansion must fall back to default');
if (sanitized.magic_effects !== 'All') throw new Error('invalid historical magic effect mode must fall back to default');
if (sanitized.loot_destinations.join(',') !== 'world') throw new Error('invalid historical loot destinations must be removed');
