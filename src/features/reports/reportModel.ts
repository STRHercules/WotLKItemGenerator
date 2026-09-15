import type { ReportRecord } from '../../types/storage';

export type ReportTabId =
  | 'summary'
  | 'validation'
  | 'world_loot'
  | 'dungeon_raid'
  | 'sets'
  | 'encounter_coverage'
  | 'distribution'
  | 'source_audit'
  | 'manifest'
  | 'difficulty_bands'
  | 'encounter_rejections';

export type ReportTab = {
  id: ReportTabId;
  label: string;
  reportType: string | null;
};

const REPORT_TAB_DEFINITIONS: ReadonlyArray<ReportTab> = [
  { id: 'validation', label: 'Validation', reportType: 'validation' },
  { id: 'world_loot', label: 'World Loot', reportType: 'world_loot' },
  { id: 'dungeon_raid', label: 'Dungeons / Raids', reportType: 'dungeon_raid' },
  { id: 'sets', label: 'Sets', reportType: 'sets' },
  { id: 'encounter_coverage', label: 'Encounter Coverage', reportType: 'encounter_coverage' },
  { id: 'distribution', label: 'Distribution', reportType: 'distribution' },
  { id: 'source_audit', label: 'Source Audit', reportType: 'source_audit' },
  { id: 'manifest', label: 'Manifest', reportType: 'manifest' },
  { id: 'difficulty_bands', label: 'Difficulty Bands', reportType: 'difficulty_bands' },
  { id: 'encounter_rejections', label: 'Encounter Rejections', reportType: 'encounter_rejections' },
];

export function availableReportTabs(reports: ReportRecord[]): ReportTab[] {
  const available = new Set(reports.filter((report) => report.importState === 'available').map((report) => report.reportType));
  return [
    { id: 'summary', label: 'Summary', reportType: null },
    ...REPORT_TAB_DEFINITIONS.filter((tab) => tab.reportType && available.has(tab.reportType)),
  ];
}

export type ValidationSummary = {
  itemCount: number;
  validationErrors: number;
  nameRepairs: number;
  qualities: Record<string, number>;
  features: Record<string, number>;
};

function numericRecord(value: unknown): Record<string, number> {
  if (!value || typeof value !== 'object' || Array.isArray(value)) return {};
  const output: Record<string, number> = {};
  for (const [key, candidate] of Object.entries(value)) {
    if (typeof candidate === 'number' && Number.isFinite(candidate)) output[key] = candidate;
  }
  return output;
}

function numberField(record: Record<string, unknown>, ...keys: string[]): number {
  for (const key of keys) {
    const value = record[key];
    if (typeof value === 'number' && Number.isFinite(value)) return value;
  }
  return 0;
}

export function summarizeValidationReport(value: unknown): ValidationSummary {
  const report = value && typeof value === 'object' && !Array.isArray(value)
    ? value as Record<string, unknown>
    : {};
  return {
    itemCount: numberField(report, 'item_count', 'total_items'),
    validationErrors: numberField(report, 'validation_errors'),
    nameRepairs: numberField(report, 'name_repair_count'),
    qualities: numericRecord(report.quality_distribution ?? report.quality_counts),
    features: numericRecord(report.feature_counts),
  };
}
