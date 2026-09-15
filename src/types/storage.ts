export type RunConfiguration = {
  seed: string;
  outputDir: string;
  engineVersion: string;
  protocolVersion: number;
  expansion: string;
  itemCount: number;
  classes: string[];
  config: Record<string, unknown>;
};

export type RunRecord = {
  id: string;
  seed: string;
  status: string;
  startedAt: string;
  finishedAt: string | null;
  elapsedMs: number | null;
  outputDir: string;
  engineVersion: string;
  protocolVersion: number;
  validationErrorCount: number;
  summary: unknown;
  indexStatus: string;
  indexError: string | null;
  expansion: string;
  itemCount: number;
  classes: string[];
};

export type RunDetail = RunRecord & {
  configuration: Record<string, unknown>;
  sources: SourceFingerprint[];
};

export type RunFilter = {
  status?: string | null;
  expansion?: string | null;
  search?: string | null;
  limit?: number | null;
};

export type RunStatusUpdate = {
  status: string;
  finishedAt?: string | null;
  elapsedMs?: number | null;
  validationErrorCount?: number | null;
  summary?: unknown;
  indexStatus?: string | null;
  indexError?: string | null;
};

export type IndexSummary = {
  runId: string;
  itemCount: number;
  effectCount: number;
  socketCount: number;
};

export type LibraryQuery = {
  text?: string | null;
  runId?: string | null;
  seed?: string | null;
  className?: string | null;
  role?: string | null;
  quality?: number | null;
  kind?: string | null;
  requiredLevelMin?: number | null;
  requiredLevelMax?: number | null;
  itemLevelMin?: number | null;
  itemLevelMax?: number | null;
  itemset?: number | null;
  effectType?: string | null;
  minimumSocketCount?: number | null;
  placementType?: string | null;
  entry?: number | null;
  sort?: 'name_asc' | 'quality_desc' | 'required_level_desc' | null;
  limit?: number | null;
  offset?: number | null;
};

export type ItemSummary = {
  runId: string;
  entry: number;
  name: string;
  className: string | null;
  role: string | null;
  quality: number | null;
  requiredLevel: number | null;
  itemLevel: number | null;
  kind: string | null;
  itemset: number | null;
  setName: string | null;
  specialEffectFeature: string | null;
  socketCount: number;
  seed: string;
};

export type PagedItems = {
  items: ItemSummary[];
  total: number;
  limit: number;
  offset: number;
};

export type ItemEffect = {
  slot: number;
  spellId: number | null;
  trigger: number | null;
  charges: number | null;
  ppmRate: number | null;
  cooldown: number | null;
  category: number | null;
  categoryCooldown: number | null;
  raw: unknown;
};

export type ItemPlacement = {
  destination: string;
  profileId: string | null;
  mapId: number | null;
  difficultyId: number | null;
  instance: string | null;
  encounter: string | null;
  poolId: number | null;
  chance: number | null;
  raw: unknown;
};

export type ItemDetail = ItemSummary & {
  raw: Record<string, unknown>;
  effects: ItemEffect[];
  sockets: number[];
  placements: ItemPlacement[];
  run: RunRecord;
};

export type ReportRecord = {
  id: number;
  runId: string;
  reportType: string;
  path: string;
  importState: string;
  size: number;
  modifiedAt: string | null;
};

export type ReportPageRequest = {
  offset?: number | null;
  limit?: number | null;
};

export type ReportTablePage = {
  reportType: string;
  headers: string[];
  rows: string[][];
  offset: number;
  limit: number;
  hasMore: boolean;
  rawJson: unknown | null;
};

export type SourceFingerprint = {
  logicalName: string;
  path: string;
  sha256: string;
  size: number;
  modifiedAt: string | null;
};

export type SourcePathRequest = {
  logicalName: string;
  path: string;
};

export type SourceDriftEntry = {
  logicalName: string;
  path: string;
  status: 'unchanged' | 'modified' | 'missing' | 'new' | string;
  previous: SourceFingerprint | null;
  current: SourceFingerprint | null;
};

export type SourceDriftReport = {
  changed: boolean;
  entries: SourceDriftEntry[];
};

export type AppSettings = {
  defaultOutputDirectory: string;
  defaultDataDirectory: string;
  azerothcoreSourceRoot: string;
  defaultExpansion: 'Classic' | 'TBC' | 'Wrath' | 'All';
  defaultItemCount: number;
  rememberLastForgeConfiguration: boolean;
  animations: boolean;
  density: 'compact' | 'comfortable' | string;
  showDiscoveryFeed: boolean;
  reduceMotion: boolean;
  defaultLootChance: number;
  defaultSetRate: number;
  defaultSetMinLevel: number;
  defaultSetSize: number;
};

export type CompletedIndexResult = {
  library: IndexSummary;
  reports: ReportRecord[];
};
