import { availableReportTabs, summarizeValidationReport } from './reportModel.ts';

const reports = [
  { id: 1, runId: 'run-1', reportType: 'validation', path: 'validation_report.json', importState: 'available', size: 10, modifiedAt: null },
  { id: 2, runId: 'run-1', reportType: 'world_loot', path: 'world_item_placements.csv', importState: 'available', size: 20, modifiedAt: null },
  { id: 3, runId: 'run-1', reportType: 'sets', path: 'set_manifest.csv', importState: 'available', size: 30, modifiedAt: null },
];

const tabs = availableReportTabs(reports);
if (tabs[0]?.id !== 'summary') throw new Error('summary must always be first');
if (!tabs.some((tab) => tab.id === 'validation')) throw new Error('validation tab missing');
if (!tabs.some((tab) => tab.id === 'world_loot')) throw new Error('world loot tab missing');
if (tabs.some((tab) => tab.id === 'dungeon_raid')) throw new Error('missing reports must not create tabs');

const summary = summarizeValidationReport({
  item_count: 100000,
  validation_errors: 0,
  name_repair_count: 14,
  quality_distribution: { Uncommon: 60000, Rare: 30000, Epic: 9990, Legendary: 10 },
  feature_counts: { sets: 400, 'spell-effects': 7000, 'chance-on-hit': 2000, 'on-use': 1000 },
});
if (summary.itemCount !== 100000 || summary.validationErrors !== 0 || summary.nameRepairs !== 14) {
  throw new Error('validation summary basics are wrong');
}
if (summary.qualities.Legendary !== 10 || summary.features.sets !== 400) {
  throw new Error('validation summary distributions are wrong');
}
