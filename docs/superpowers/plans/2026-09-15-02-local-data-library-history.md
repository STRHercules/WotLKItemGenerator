# WotLK Item Forge Local Data, Library & History Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add the SQLite-backed run history, settings, source fingerprints, item Library index, report index, and safe rebuild/clear operations required by the desktop application.

**Architecture:** SQLite is owned exclusively by the Rust/Tauri backend through `rusqlite` with bundled SQLite. The generator remains file-output authoritative. Successful validated packs are imported transactionally from `items.ndjson` and report files after generation, while failed/cancelled runs remain history records without Library rows.

**Tech Stack:** Rust, rusqlite 0.40.x with `bundled`, serde/serde_json, uuid, chrono; Tauri commands; React/TypeScript query clients.

**Spec:** `docs/superpowers/specs/2026-09-15-wotlk-item-forge-desktop-design.md`

## Global Constraints

- Implement after Plan 1.
- A run UUID is the durable identity; seed is not unique.
- Index only successful validated packs by default.
- Indexing failure must not change a successful generation into a failed generation.
- Clearing/rebuilding the Library index must never delete generated pack files.
- Database schema changes use explicit migrations and schema versioning.
- Database and application state live in a user-writable app-data directory, not Program Files.

---

## File Structure Locked by This Plan

- `src-tauri/migrations/001_init.sql` — initial schema and indexes.
- `src-tauri/src/storage/mod.rs` — storage exports.
- `src-tauri/src/storage/db.rs` — connection/migration setup.
- `src-tauri/src/storage/models.rs` — serializable run/item/report/query models.
- `src-tauri/src/storage/runs.rs` — run/history persistence.
- `src-tauri/src/storage/library.rs` — item import/search/detail/index operations.
- `src-tauri/src/storage/reports.rs` — report file metadata and lightweight parsing helpers.
- `src-tauri/src/storage/settings.rs` — persisted settings.
- `src-tauri/src/storage/sources.rs` — source fingerprint persistence/comparison.
- `src-tauri/src/commands/storage.rs` — Tauri storage commands.
- `src/types/storage.ts` — frontend storage DTOs.
- `src/lib/tauriStorage.ts` — typed frontend invoke wrapper.

---

### Task 1: Create the Versioned SQLite Schema and Migration Runner

**Files:**
- Create: `src-tauri/migrations/001_init.sql`
- Create: `src-tauri/src/storage/db.rs`
- Create: `src-tauri/src/storage/models.rs`
- Create: `src-tauri/src/storage/mod.rs`
- Modify: `src-tauri/Cargo.toml`

**Interfaces:**
- Produces: `Database::open(path: &Path) -> Result<Database>`.
- Produces: `Database::open_in_memory() -> Result<Database>` for tests.
- Produces schema version `1` in table `schema_meta`.

- [ ] **Step 1: Write a failing in-memory migration test**

Test that `Database::open_in_memory()` creates `runs`, `run_configuration`, `run_sources`, `generated_items`, `item_effects`, `item_sockets`, `item_placements`, `report_index`, and `settings`, and records schema version `1`.

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::db::tests::migration_creates_schema`

Expected: FAIL.

- [ ] **Step 2: Add rusqlite and supporting dependencies**

Use:

```toml
rusqlite = { version = "0.40", features = ["bundled"] }
serde_json = "1"
uuid = { version = "1", features = ["v4", "serde"] }
chrono = { version = "0.4", features = ["serde"] }
```

- [ ] **Step 3: Create `001_init.sql` with exact core tables and indexes**

Required columns include all fields specified in the design. Add indexes for `generated_items(run_id)`, `entry`, `name COLLATE NOCASE`, `class_name`, `quality`, `required_level`, `item_level`, `kind`, `itemset`, `special_effect_feature`, and composite `(run_id, quality, item_level)`.

Foreign keys use `ON DELETE CASCADE` for database-owned dependent rows only. Nothing in SQL touches pack folders.

- [ ] **Step 4: Implement migration runner**

`Database::open` enables `PRAGMA foreign_keys=ON`, uses WAL mode for file-backed databases, runs migrations transactionally, and errors on a database whose schema version is newer than the app understands.

- [ ] **Step 5: Run tests**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::db`

Expected: PASS.

- [ ] **Step 6: Commit**

```bash
git add src-tauri/Cargo.toml src-tauri/migrations src-tauri/src/storage
git commit -m "feat(storage): add versioned SQLite schema"
```

---

### Task 2: Persist Run History and Exact Configuration

**Files:**
- Create: `src-tauri/src/storage/runs.rs`
- Modify: `src-tauri/src/storage/models.rs`
- Create: `src-tauri/src/storage/runs_tests.rs` or module tests

**Interfaces:**
- Produces: `create_run(config: &RunConfiguration) -> Result<RunRecord>`.
- Produces: `update_run_status(id, RunStatusUpdate) -> Result<()>`.
- Produces: `get_run(id) -> Result<RunDetail>`.
- Produces: `list_runs(filter: RunFilter) -> Result<Vec<RunRecord>>`.

- [ ] **Step 1: Write failing tests for UUID identity and repeated seeds**

Insert two runs with the same seed but different configurations. Assert distinct UUIDs, preserved config JSON, correct ordering by `started_at DESC`, and independent statuses.

- [ ] **Step 2: Implement run models and persistence**

Use string UUIDs in SQLite, RFC3339 UTC timestamps, elapsed milliseconds, `summary_json`, engine/protocol versions, and validation error count. Store exact normalized config JSON in `run_configuration` one-to-one with the run.

- [ ] **Step 3: Add state-transition validation**

Allow the lifecycle states from the spec. Prevent a terminal state (`complete`, `failed`, `cancelled`) from being overwritten with an earlier active state unless a dedicated repair/migration path is used.

- [ ] **Step 4: Run tests and commit**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::runs`

Commit:

```bash
git add src-tauri/src/storage
git commit -m "feat(history): persist generation runs and exact configuration"
```

---

### Task 3: Import `items.ndjson` Transactionally

**Files:**
- Create: `src-tauri/src/storage/library.rs`
- Modify: `src-tauri/src/storage/models.rs`

**Interfaces:**
- Produces: `index_run_pack(run_id: &str, output_dir: &Path) -> Result<IndexSummary>`.
- Produces: `delete_run_index(run_id: &str) -> Result<u64>` without deleting filesystem content.
- Produces: `rebuild_run_index(run_id: &str, output_dir: &Path) -> Result<IndexSummary>`.

- [ ] **Step 1: Create a tiny NDJSON fixture in the Rust test temp directory and write a failing import test**

Fixture includes one Legendary item with stats, sockets, effect package, set metadata, IDs, and raw JSON. Assert import creates one `generated_items` row plus normalized effect/socket rows.

- [ ] **Step 2: Implement streaming NDJSON import**

Read line-by-line with `BufRead`, deserialize each line to `serde_json::Value`, extract searchable columns defensively, preserve complete `raw_json`, and insert in a single transaction using prepared statements.

Batch transaction scope is the whole run import; on malformed JSON, roll back all rows for that run and return the line number/error.

- [ ] **Step 3: Add duplicate run protection and rebuild semantics**

A second `index_run_pack` for the same run returns an explicit `AlreadyIndexed` error. `rebuild_run_index` deletes only DB-owned rows for that run inside the same transaction before reimporting.

- [ ] **Step 4: Add a synthetic 100k-row performance test marked ignored by default**

The test generates simple NDJSON and records import duration; it must be runnable explicitly with `cargo test -- --ignored`. Do not put a brittle wall-clock assertion in the default test suite.

- [ ] **Step 5: Run tests and commit**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::library`

Commit:

```bash
git add src-tauri/src/storage
git commit -m "feat(library): index generated NDJSON packs transactionally"
```

---

### Task 4: Add Library Search, Filters, Pagination, and Item Detail

**Files:**
- Modify: `src-tauri/src/storage/library.rs`
- Modify: `src-tauri/src/storage/models.rs`

**Interfaces:**
- Produces: `search_items(query: LibraryQuery) -> Result<PagedItems>`.
- Produces: `get_item(run_id: &str, entry: i64) -> Result<ItemDetail>`.
- `LibraryQuery` supports text, run, seed via run join, class, role, quality, kind, required/item level ranges, set, effect type, minimum socket count, placement type, entry ID, sort, limit, offset.

- [ ] **Step 1: Write failing multi-filter tests**

Seed several items across two runs. Test combined `class=Paladin + quality=5`, item-level ranges, exact entry, run scoping, case-insensitive text search, deterministic sorting, limit/offset, and detail raw JSON.

- [ ] **Step 2: Implement parameterized SQL query construction**

Never interpolate user values directly into SQL. Build WHERE clauses and bound parameter values. Clamp page size to `1..=200`. Default sort is `item_level DESC, entry ASC`.

For text search v1, use `name LIKE ? COLLATE NOCASE` with `%escaped_term%`; keep the implementation behind one function so FTS can be added later without changing command contracts.

- [ ] **Step 3: Add detail relationships**

`get_item` loads normalized effects, sockets, placements, run metadata, and raw JSON.

- [ ] **Step 4: Run tests and commit**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::library`

Commit:

```bash
git add src-tauri/src/storage
git commit -m "feat(library): add searchable item queries and detail views"
```

---

### Task 5: Import Report Index and Placement Relationships

**Files:**
- Create: `src-tauri/src/storage/reports.rs`
- Modify: `src-tauri/src/storage/library.rs`
- Modify: `src-tauri/src/storage/models.rs`

**Interfaces:**
- Produces: `index_reports(run_id, output_dir) -> Result<Vec<ReportRecord>>`.
- Produces: `list_reports(run_id) -> Result<Vec<ReportRecord>>`.
- Produces: `read_report_table(run_id, report_type, page) -> Result<ReportTablePage>` for supported CSV/JSON reports.

- [ ] **Step 1: Write failing fixture tests**

Create small temporary `validation_report.json`, `world_item_placements.csv`, `dungeon_raid_item_placements.csv`, and `set_manifest.csv`. Assert report type/path registration and item placement import.

- [ ] **Step 2: Implement deterministic report discovery**

Recognize only the known filenames from the generator. Unknown files are not auto-rendered, but remain in the output folder. Store absolute path, type, import state, size, and modified timestamp.

- [ ] **Step 3: Implement paged CSV/JSON reads**

Parse CSV headers and rows with the Rust `csv` crate. Return display-safe strings; do not render HTML. Parse validation summary JSON into typed summary fields plus original raw object.

- [ ] **Step 4: Import placement relationships**

Populate `item_placements` from world and dungeon/raid placement CSVs keyed by run and entry.

- [ ] **Step 5: Run tests and commit**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::reports`

Commit:

```bash
git add src-tauri/Cargo.toml src-tauri/src/storage
git commit -m "feat(reports): index pack reports and placement relationships"
```

---

### Task 6: Persist Sources, Settings, and Source Drift

**Files:**
- Create: `src-tauri/src/storage/sources.rs`
- Create: `src-tauri/src/storage/settings.rs`
- Modify: `src-tauri/src/storage/models.rs`

**Interfaces:**
- Produces: `save_run_sources(run_id, &[SourceFingerprint])`.
- Produces: `compare_run_sources(run_id, &[SourceFingerprint]) -> SourceDriftReport`.
- Produces: `get_settings() -> AppSettings`, `save_settings(AppSettings)`.

- [ ] **Step 1: Write failing source drift tests**

Test unchanged, modified fingerprint, missing historical source, and newly configured source. Drift output names the logical source and old/current fingerprint state.

- [ ] **Step 2: Implement SHA-256 source fingerprints**

Fingerprint required/selected data files by bytes. For large files, stream through a fixed buffer. Store size and modified timestamp as diagnostics, but hash is the comparison authority.

- [ ] **Step 3: Implement settings persistence**

Store a single JSON value under key `app_settings` in the `settings` table. Deserialize with defaults for newly added fields. Fields include default output directory, expansion, item count, remember-last-config, generator defaults, appearance preferences, and saved path choices.

- [ ] **Step 4: Run tests and commit**

Run: `cargo test --manifest-path src-tauri/Cargo.toml storage::sources storage::settings`

Commit:

```bash
git add src-tauri/src/storage
git commit -m "feat(settings): persist app settings and source drift fingerprints"
```

---

### Task 7: Expose Typed Tauri Storage Commands

**Files:**
- Create: `src-tauri/src/commands/storage.rs`
- Modify: `src-tauri/src/commands/mod.rs`
- Modify: `src-tauri/src/lib.rs`
- Create: `src/types/storage.ts`
- Create: `src/lib/tauriStorage.ts`

**Interfaces:**
- Commands: `list_runs`, `get_run`, `search_items`, `get_item`, `list_reports`, `read_report_table`, `get_settings`, `save_settings`, `delete_run_index`, `rebuild_run_index`, `compare_source_drift`.

- [ ] **Step 1: Add Rust command-level serialization tests**

Verify representative DTOs serialize with stable snake_case/camelCase convention selected for the frontend. Use camelCase at the Tauri boundary via serde rename rules.

- [ ] **Step 2: Implement commands as thin wrappers**

Commands validate path/run arguments and delegate to storage modules. No SQL is written inside command functions.

- [ ] **Step 3: Add TypeScript DTOs and invoke wrappers**

Define frontend interfaces matching Rust DTOs exactly and one wrapper per Tauri command. Do not scatter raw `invoke()` strings through feature components.

- [ ] **Step 4: Run all checks and commit**

Run:

```bash
cargo test --manifest-path src-tauri/Cargo.toml
npm test
npm run build
```

Commit:

```bash
git add src-tauri src/types src/lib
git commit -m "feat(storage): expose typed desktop data APIs"
```

---

## Plan 2 Exit Criteria

The app can persist every run, import successful `items.ndjson`, browse/search indexed items, read known report files, retain failed/cancelled history without item indexing, persist settings, and detect source drift. Deleting or rebuilding indexes never removes output packs.
