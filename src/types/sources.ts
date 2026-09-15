export type SourceScanRequest = {
  dataDir?: string | null;
  azerothcoreSourceRoot?: string | null;
  outputDir?: string | null;
  calculateFingerprints?: boolean;
};

export type SourceStatus = {
  logicalName: string;
  kind: 'DBC' | 'SQL' | string;
  required: boolean;
  path: string;
  exists: boolean;
  size: number | null;
  modifiedAt: string | null;
  origin: 'bundled' | 'override' | string;
  sha256: string | null;
};

export type SourceCacheStatus = {
  path: string;
  exists: boolean;
  size: number | null;
  modifiedAt: string | null;
  state: string;
};

export type SourceHealthReport = {
  health: 'healthy' | 'error' | string;
  requiredFound: number;
  requiredTotal: number;
  optionalFound: number;
  optionalTotal: number;
  azerothcoreReady: boolean;
  azerothcorePath: string;
  dbcReady: boolean;
  outputWritable: boolean;
  dataDirectory: string;
  dataOrigin: string;
  sources: SourceStatus[];
  cache: SourceCacheStatus;
};
