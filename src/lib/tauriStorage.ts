import { invoke } from '@tauri-apps/api/core';
import type {
  AppSettings,
  CompletedIndexResult,
  IndexSummary,
  ItemDetail,
  LibraryQuery,
  PagedItems,
  ReportPageRequest,
  ReportRecord,
  ReportTablePage,
  RunConfiguration,
  RunDetail,
  RunFilter,
  RunRecord,
  RunStatusUpdate,
  SourceDriftReport,
  SourceFingerprint,
  SourcePathRequest,
} from '../types/storage';

export function createRun(config: RunConfiguration): Promise<RunRecord> {
  return invoke<RunRecord>('create_run', { config });
}

export function createRunWithId(runId: string, config: RunConfiguration): Promise<RunRecord> {
  return invoke<RunRecord>('create_run_with_id', { runId, config });
}

export function updateRunStatus(runId: string, update: RunStatusUpdate): Promise<void> {
  return invoke('update_run_status', { runId, update });
}

export function updateRunRuntimeMetadata(runId: string, seed: string, outputDir: string): Promise<void> {
  return invoke('update_run_runtime_metadata', { runId, seed, outputDir });
}

export function listRuns(filter: RunFilter = {}): Promise<RunRecord[]> {
  return invoke<RunRecord[]>('list_runs', { filter });
}

export function getRun(runId: string): Promise<RunDetail> {
  return invoke<RunDetail>('get_run', { runId });
}

export function searchItems(query: LibraryQuery = {}): Promise<PagedItems> {
  return invoke<PagedItems>('search_items', { query });
}

export function getItem(runId: string, entry: number): Promise<ItemDetail> {
  return invoke<ItemDetail>('get_item', { runId, entry });
}

export function indexRunPack(runId: string, outputDir: string): Promise<IndexSummary> {
  return invoke<IndexSummary>('index_run_pack', { runId, outputDir });
}

export function indexCompletedRun(runId: string, outputDir: string): Promise<CompletedIndexResult> {
  return invoke<CompletedIndexResult>('index_completed_run', { runId, outputDir });
}

export function deleteRunIndex(runId: string): Promise<number> {
  return invoke<number>('delete_run_index', { runId });
}

export function rebuildRunIndex(runId: string, outputDir: string): Promise<IndexSummary> {
  return invoke<IndexSummary>('rebuild_run_index', { runId, outputDir });
}

export function indexReports(runId: string, outputDir: string): Promise<ReportRecord[]> {
  return invoke<ReportRecord[]>('index_reports', { runId, outputDir });
}

export function listReports(runId: string): Promise<ReportRecord[]> {
  return invoke<ReportRecord[]>('list_reports', { runId });
}

export function readReportTable(
  runId: string,
  reportType: string,
  page: ReportPageRequest = {},
): Promise<ReportTablePage> {
  return invoke<ReportTablePage>('read_report_table', { runId, reportType, page });
}

export function openReportFile(reportId: number): Promise<void> {
  return invoke('open_report_file', { reportId });
}

export function openRunOutput(runId: string): Promise<void> {
  return invoke('open_run_output', { runId });
}

export function getSettings(): Promise<AppSettings> {
  return invoke<AppSettings>('get_settings');
}

export function saveSettings(settings: AppSettings): Promise<void> {
  return invoke('save_settings', { settings });
}

export function fingerprintSources(sources: SourcePathRequest[]): Promise<SourceFingerprint[]> {
  return invoke<SourceFingerprint[]>('fingerprint_sources', { sources });
}

export function saveRunSources(runId: string, sources: SourceFingerprint[]): Promise<void> {
  return invoke('save_run_sources', { runId, sources });
}

export function compareSourceDrift(
  runId: string,
  current: SourceFingerprint[],
): Promise<SourceDriftReport> {
  return invoke<SourceDriftReport>('compare_source_drift', { runId, current });
}
