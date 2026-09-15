BEGIN;

CREATE TABLE IF NOT EXISTS schema_meta (
    version INTEGER NOT NULL
);
INSERT INTO schema_meta(version)
SELECT 1
WHERE NOT EXISTS (SELECT 1 FROM schema_meta);

CREATE TABLE IF NOT EXISTS runs (
    id TEXT PRIMARY KEY,
    seed TEXT NOT NULL,
    status TEXT NOT NULL,
    started_at TEXT NOT NULL,
    finished_at TEXT,
    elapsed_ms INTEGER,
    output_dir TEXT NOT NULL,
    engine_version TEXT NOT NULL,
    protocol_version INTEGER NOT NULL,
    validation_error_count INTEGER NOT NULL DEFAULT 0,
    summary_json TEXT NOT NULL DEFAULT '{}',
    index_status TEXT NOT NULL DEFAULT 'not_indexed',
    index_error TEXT,
    expansion TEXT NOT NULL,
    item_count INTEGER NOT NULL,
    classes_json TEXT NOT NULL DEFAULT '[]'
);
CREATE INDEX IF NOT EXISTS idx_runs_started_at ON runs(started_at DESC);
CREATE INDEX IF NOT EXISTS idx_runs_seed ON runs(seed);
CREATE INDEX IF NOT EXISTS idx_runs_status ON runs(status);

CREATE TABLE IF NOT EXISTS run_configuration (
    run_id TEXT PRIMARY KEY REFERENCES runs(id) ON DELETE CASCADE,
    config_json TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS run_sources (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    run_id TEXT NOT NULL REFERENCES runs(id) ON DELETE CASCADE,
    logical_name TEXT NOT NULL,
    path TEXT NOT NULL,
    sha256 TEXT NOT NULL,
    size INTEGER NOT NULL,
    modified_at TEXT,
    UNIQUE(run_id, logical_name, path)
);
CREATE INDEX IF NOT EXISTS idx_run_sources_run ON run_sources(run_id);

CREATE TABLE IF NOT EXISTS generated_items (
    run_id TEXT NOT NULL REFERENCES runs(id) ON DELETE CASCADE,
    entry INTEGER NOT NULL,
    name TEXT NOT NULL,
    class_name TEXT,
    role TEXT,
    quality INTEGER,
    required_level INTEGER,
    item_level INTEGER,
    kind TEXT,
    weapon_kind TEXT,
    inventory_type INTEGER,
    subclass INTEGER,
    displayid INTEGER,
    reference_entry INTEGER,
    armor INTEGER,
    dps REAL,
    itemset INTEGER,
    set_name TEXT,
    special_effect_feature TEXT,
    effect_source_entry INTEGER,
    effect_source_spell INTEGER,
    socket_bonus INTEGER,
    disenchant_id INTEGER,
    socket_count INTEGER NOT NULL DEFAULT 0,
    raw_json TEXT NOT NULL,
    PRIMARY KEY(run_id, entry)
);
CREATE INDEX IF NOT EXISTS idx_generated_items_run ON generated_items(run_id);
CREATE INDEX IF NOT EXISTS idx_generated_items_entry ON generated_items(entry);
CREATE INDEX IF NOT EXISTS idx_generated_items_name ON generated_items(name COLLATE NOCASE);
CREATE INDEX IF NOT EXISTS idx_generated_items_class ON generated_items(class_name);
CREATE INDEX IF NOT EXISTS idx_generated_items_quality ON generated_items(quality);
CREATE INDEX IF NOT EXISTS idx_generated_items_required_level ON generated_items(required_level);
CREATE INDEX IF NOT EXISTS idx_generated_items_item_level ON generated_items(item_level);
CREATE INDEX IF NOT EXISTS idx_generated_items_kind ON generated_items(kind);
CREATE INDEX IF NOT EXISTS idx_generated_items_itemset ON generated_items(itemset);
CREATE INDEX IF NOT EXISTS idx_generated_items_effect ON generated_items(special_effect_feature);
CREATE INDEX IF NOT EXISTS idx_generated_items_run_quality_ilvl ON generated_items(run_id, quality, item_level);

CREATE TABLE IF NOT EXISTS item_effects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    run_id TEXT NOT NULL,
    entry INTEGER NOT NULL,
    slot INTEGER NOT NULL,
    spell_id INTEGER,
    trigger INTEGER,
    charges INTEGER,
    ppm_rate REAL,
    cooldown INTEGER,
    category INTEGER,
    category_cooldown INTEGER,
    raw_json TEXT NOT NULL,
    FOREIGN KEY(run_id, entry) REFERENCES generated_items(run_id, entry) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_item_effects_item ON item_effects(run_id, entry);

CREATE TABLE IF NOT EXISTS item_sockets (
    run_id TEXT NOT NULL,
    entry INTEGER NOT NULL,
    slot INTEGER NOT NULL,
    color INTEGER NOT NULL,
    PRIMARY KEY(run_id, entry, slot),
    FOREIGN KEY(run_id, entry) REFERENCES generated_items(run_id, entry) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS item_placements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    run_id TEXT NOT NULL,
    entry INTEGER NOT NULL,
    destination TEXT NOT NULL,
    profile_id TEXT,
    map_id INTEGER,
    difficulty_id INTEGER,
    instance TEXT,
    encounter TEXT,
    pool_id INTEGER,
    chance REAL,
    raw_json TEXT NOT NULL,
    FOREIGN KEY(run_id, entry) REFERENCES generated_items(run_id, entry) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS idx_item_placements_item ON item_placements(run_id, entry);
CREATE INDEX IF NOT EXISTS idx_item_placements_destination ON item_placements(run_id, destination);

CREATE TABLE IF NOT EXISTS report_index (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    run_id TEXT NOT NULL REFERENCES runs(id) ON DELETE CASCADE,
    report_type TEXT NOT NULL,
    path TEXT NOT NULL,
    import_state TEXT NOT NULL DEFAULT 'available',
    size INTEGER NOT NULL DEFAULT 0,
    modified_at TEXT,
    UNIQUE(run_id, report_type, path)
);
CREATE INDEX IF NOT EXISTS idx_report_index_run ON report_index(run_id);

CREATE TABLE IF NOT EXISTS settings (
    key TEXT PRIMARY KEY,
    value_json TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

COMMIT;
