import { invoke } from '@tauri-apps/api/core';
import type { SourceCacheStatus, SourceHealthReport, SourceScanRequest } from '../types/sources';

export function scanSources(request: SourceScanRequest): Promise<SourceHealthReport> {
  return invoke<SourceHealthReport>('scan_sources', { request });
}
export function clearSourceCache(): Promise<SourceCacheStatus> {
  return invoke<SourceCacheStatus>('clear_source_cache');
}
export function rebuildSourceCache(): Promise<SourceCacheStatus> {
  return invoke<SourceCacheStatus>('rebuild_source_cache');
}
