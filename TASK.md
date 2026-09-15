# WotLK Item Forge Desktop Application — Codex Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `superpowers:subagent-driven-development` (recommended) or `superpowers:executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert the existing `generate_pack.py` WotLK/AzerothCore item generator into a polished, self-contained Windows desktop application using Tauri 2 + React/TypeScript, while preserving the Python generator as the generation authority and adding a persistent local Library that remembers every generated pack and every generated item.

**Architecture:** Tauri owns the desktop shell, native dialogs, settings, process lifecycle, persistent history database, and frontend event bridge. The existing Python generator remains responsible for all WotLK item-generation rules, validation, DBC/SQL output, and report generation. The Python generator is packaged as a Windows sidecar executable and emits structured JSONL progress events that Rust forwards to the React UI.

**Tech Stack:** Tauri 2.x, Rust, React + TypeScript + Vite, `tauri-plugin-shell`, `tauri-plugin-dialog`, SQLite via `rusqlite`, Python 3 packaged with PyInstaller, Vitest + React Testing Library, Cargo tests, pytest.

**Spec:** Embedded below under **Product Specification**. This is intentionally a single-file Codex handoff.

## Global Constraints

- Windows is the first-class target.
- The finished application must be self-contained. End users must not need Python, pip, Node.js, or a terminal.
- Keep `generate_pack.py` as the source of truth for item generation.
- Do not port the 7,800+ line generator to Rust or TypeScript.
- Existing command-line behavior must remain usable and backward compatible unless a change is explicitly described here.
- Existing deterministic seed behavior must remain deterministic.
- Existing validation must remain mandatory before outputs are considered successful.
- Existing output formats must remain available, including SQL, DBCs, CSV manifests, `items.ndjson`, `validation_report.json`, checksums, and README output.
- The desktop app must support a configurable external `Data` directory and remember the selected directory.
- First run should auto-detect a valid local `Data` directory when available.
- The desktop app must use a writable user-selected/default output location, not the installed executable directory.
- Do not stream every generated item through Tauri IPC. Progress/event streaming must remain bounded.
- Persistent history must survive app restarts and must not depend on the generated output directory continuing to exist.
- A failed Library import must never delete or invalidate a successfully generated output pack.
- No telemetry or network dependency is required for v1.
- Prefer focused modules over a monolithic Tauri `lib.rs` or giant React page.

---

# Product Specification

## 1. Product identity

Working product name:

**WotLK Item Forge**

Subtitle:

**AzerothCore • WotLK 3.3.5a**

The app should feel like a polished desktop utility rather than a terminal wrapper. It may borrow WoW rarity colors as accents, but the main interface should remain readable and modern rather than attempting to imitate the original WoW UI.

Recommended visual direction:

- dark neutral background
- cool blue/cyan primary accent
- restrained purple/magenta accents
- rarity colors only where semantically useful
- rounded panels
- clear status icons
- compact but readable data tables
- subtle animation during generation, disabled when reduced motion is preferred

Do not block implementation on custom artwork. Use CSS/HTML first.

## 2. Approved navigation model

Use a hybrid desktop layout with persistent navigation and a persistent run summary.

Primary tabs:

1. **Sources**
2. **Generation**
3. **Advanced**
4. **Library**

When a generation is active, the central area switches to a dedicated **Forge Progress** view. The navigation may remain visible, but controls that would mutate the active run must be disabled.

A persistent bottom/right summary area should show:

- selected Data folder
- item count
- selected class mode
- loot destinations
- enabled feature count
- output folder
- source readiness
- main **Forge Items** button

## 3. Sources tab

The app must support both automatic and manually selected source directories.

### Resolution behavior

On first launch:

1. Check for a usable `Data` directory next to the application/portable executable.
2. If not found, check any migration/import hint supplied during development.
3. Otherwise show Sources as unconfigured.

After the user explicitly chooses a Data directory, the saved choice wins on future launches as long as it still exists. If it becomes unavailable, show it as missing and offer automatic rediscovery.

### Source status

The generator remains the authority for the required/optional file manifest.

Current required files include:

DBC:
- `Item.dbc`
- `ItemSet.dbc`
- `Spell.dbc`
- `SpellItemEnchantment.dbc`
- `Map.dbc`
- `MapDifficulty.dbc`
- `DungeonMap.dbc`

SQL:
- `creature_loot_template.sql`
- `reference_loot_template.sql`
- `item_template.sql`
- `disenchant_loot_template.sql`
- `spell_proc.sql`
- `spell_script_names.sql`
- `creature.sql`
- `creature_template.sql`
- `instance_encounters.sql`

Current optional files include:

DBC:
- `Item.custom.dbc`

SQL:
- `gameobject.sql`
- `gameobject_template.sql`
- `gameobject_loot_template.sql`

The UI should display each file with:

- type
- filename
- required/optional
- found/missing
- resolved path

Actions:

- **Change Data Folder**
- **Rescan**
- **Open Data Folder**
- **Reset to Auto-Detect**

Generation is disabled when required sources for the chosen generation mode are missing.

## 4. Generation tab

Expose the common settings without overwhelming the user.

### Fields

**Item count**
- integer
- normal default: 100,000
- total cap: 200,000
- single-class cap: 20,000

**Class**
- All Classes
- Warrior
- Paladin
- Hunter
- Rogue
- Priest
- Death Knight
- Shaman
- Mage
- Warlock
- Druid

Do not invent arbitrary multi-class selection in v1 because the current generator exposes either all classes or one selected class.

**Loot destinations**
Use independent checkboxes:
- World
- Dungeon
- Raid

All checked by default.

Allow none selected, meaning generated items are not inserted into loot tables.

**Loot chance**
- percent
- default 2.0
- valid range `(0, 100]` when loot insertion is enabled

**Seed**
- Automatic by default
- optional explicit numeric/string seed using the generator's existing accepted format
- show the actual resolved seed once a run starts

**Output location**
- app remembers selected output root
- default to a writable user location such as `Documents/WotLK Item Forge/Packs`
- allow native folder picker
- never default to Program Files or the installed sidecar directory

## 5. Advanced tab

Mirror the existing generator options.

### Feature toggles

Enabled by default unless the generator default says otherwise:

- Sets
- Spell Effects
- Chance on Hit
- On Use
- Socket Bonuses
- Disenchant

The UI sends disabled features to Python; do not duplicate feature logic in the frontend.

### Advanced numeric settings

- Set Rate: default `0.20`
- Set Minimum Level: default `20`
- Set Size: default `5`
- Spell Effect Rate Multiplier: default `1.0`
- Proc Rate Multiplier: default `1.0`
- On Use Rate Multiplier: default `1.0`
- Effect ilvl Window: default `15`
- Socket Bonus Rate: default `100.0`
- Disenchant Rate: default `100.0`
- Max Special Effects: default `1`
- Item DBC Overwrite: default false
- Verbose Audit: default false

Use inline validation and helper text copied from the generator's CLI semantics.

Include a **Restore Defaults** action for Advanced only.

## 6. Forge Progress view

The existing Python UI abstraction already exposes the right semantic events. Reuse those semantics rather than parsing human terminal text.

Display:

- current phase
- phase detail
- overall progress bar
- current item/detail
- elapsed time
- per-class progress when available
- source checks during startup
- recent discoveries
- validation state
- cancel button

Recent discoveries should include the generator's existing notable events:

- Legendary
- generated set
- proc
- on-use
- special effect
- optionally Epic when `show items` behavior is enabled later

Do not emit an IPC event for every item. The Python JSONL UI should throttle progress and only emit notable item events.

### Cancellation

The Tauri backend owns the sidecar process handle.

`Cancel Generation` should:

1. ask for confirmation if output writing has begun
2. terminate the child process
3. emit a cancelled state
4. leave any partial output clearly marked/incomplete
5. never write a successful Library record for a cancelled generation

## 7. Completion view

On success, show:

- seed
- items generated
- quality counts
- class counts
- feature counts
- sets
- effects
- procs
- on-use
- socket bonuses
- disenchantable count
- name repairs
- validation status
- elapsed time
- output path

Actions:

- **Open Pack Folder**
- **View in Library**
- **Forge Another Pack**

The Python report already contains the authoritative counts. Do not recompute them independently unless needed for a consistency assertion.

## 8. Persistent Library tab

This is a first-class v1 requirement.

The application must permanently remember:

- every successful generated pack
- the generation settings used
- the generation report
- every generated item in that pack
- enough complete per-item data to inspect the item later even if the output directory is deleted
- the original output directory path
- whether that output directory still exists

### Pack list

Default sort: newest first.

Columns/cards:

- generated date/time
- seed
- total items
- classes
- quality summary
- loot destinations
- validation status
- output folder status

Filters:

- seed text
- class
- date
- validation status

Actions per pack:

- Open
- Open Output Folder, if it still exists
- Regenerate With Same Settings
- Remove From Library

`Remove From Library` deletes the history record and item snapshots only. It must not delete the generated files unless a separate explicit destructive command is added in a future version.

### Pack detail

Show:

- summary/report
- exact saved generation configuration
- source paths used at generation time
- output path
- item browser

### Item browser

Search and filter by:

- name
- entry ID
- class
- quality
- role
- kind
- required level
- item level
- set membership
- special-effect feature

Display columns:

- Entry
- Name
- Class
- Quality
- Required Level
- Item Level
- Role
- Kind
- Set
- Effect

Selecting an item opens a detail pane containing the complete archived item record.

### Persistence guarantee

The Library must not merely scan output folders on app startup.

On successful generation, import a durable snapshot into the app's SQLite database. The output directory is a convenience/reference after that point.

## 9. Library storage design

Store the SQLite database under Tauri's app-local/app-data directory, not beside the executable.

Recommended database filename:

`wotlk-item-forge.sqlite3`

Enable:

```sql
PRAGMA foreign_keys = ON;
PRAGMA journal_mode = WAL;
PRAGMA synchronous = NORMAL;
```

### Schema v1

```sql
CREATE TABLE IF NOT EXISTS schema_meta (
    version INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS app_settings (
    key TEXT PRIMARY KEY,
    value_json TEXT NOT NULL,
    updated_at TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS packs (
    id TEXT PRIMARY KEY,
    seed TEXT NOT NULL,
    created_at TEXT NOT NULL,
    completed_at TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('complete', 'history_import_failed')),
    output_path TEXT NOT NULL,
    data_path TEXT NOT NULL,
    requested_number INTEGER NOT NULL,
    item_count INTEGER NOT NULL,
    selected_classes_json TEXT NOT NULL,
    loot_destinations_json TEXT NOT NULL,
    config_json TEXT NOT NULL,
    report_json TEXT NOT NULL,
    items_checksum TEXT,
    validation_errors INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_packs_completed_at
    ON packs(completed_at DESC);

CREATE INDEX IF NOT EXISTS idx_packs_seed
    ON packs(seed);

CREATE TABLE IF NOT EXISTS items (
    pack_id TEXT NOT NULL,
    entry INTEGER NOT NULL,
    name TEXT NOT NULL,
    class_name TEXT NOT NULL,
    quality INTEGER NOT NULL,
    required_level INTEGER NOT NULL,
    item_level INTEGER NOT NULL,
    role TEXT,
    kind TEXT,
    weapon_kind TEXT,
    inventory_type INTEGER,
    subclass INTEGER,
    displayid INTEGER,
    itemset INTEGER,
    special_effect_feature TEXT,
    socket_bonus INTEGER,
    disenchant_id INTEGER,
    raw_json TEXT NOT NULL,
    PRIMARY KEY (pack_id, entry),
    FOREIGN KEY (pack_id) REFERENCES packs(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_items_pack_name
    ON items(pack_id, name COLLATE NOCASE);

CREATE INDEX IF NOT EXISTS idx_items_pack_class
    ON items(pack_id, class_name);

CREATE INDEX IF NOT EXISTS idx_items_pack_quality
    ON items(pack_id, quality);

CREATE INDEX IF NOT EXISTS idx_items_pack_level
    ON items(pack_id, required_level, item_level);

CREATE INDEX IF NOT EXISTS idx_items_pack_set
    ON items(pack_id, itemset);

CREATE INDEX IF NOT EXISTS idx_items_entry
    ON items(entry);
```

For v1, store complete `raw_json` so history is self-contained. If real-world database size becomes excessive, introduce transparent compression in a later schema migration rather than compromising v1 history correctness.

### Import behavior

After Python emits a successful `complete` event:

1. Rust reads `validation_report.json`.
2. Rust verifies the `items.ndjson` checksum when `CHECKSUMS.txt` is available.
3. Rust creates a new UUID `pack_id`.
4. Rust inserts the pack and all items in one database transaction.
5. Read `items.ndjson` as a stream. Do not load 100,000–200,000 JSON objects into RAM at once.
6. Reuse one prepared item INSERT statement.
7. Commit only after the complete item count equals the report's `total_items`.
8. If import fails, roll back item inserts, preserve the generated files, and show a recoverable "Pack generated but Library import failed" message.
9. Provide a retry-import path from the completion screen.

## 10. Existing generator integration points

The current Python file already has useful boundaries. Preserve them:

- `parse_args(...)`
- `configure_runtime(...)`
- `build_runtime_skeletons(...)`
- `finish_items(...)`
- `repair_item_names(...)`
- `validate(...)`
- `write_outputs(...)`
- UI classes and `create_terminal_ui(...)`
- `main(...)`

The desktop integration should extend the existing UI abstraction, not bypass it.

The current main sequence is already ideal:

```text
configure runtime
→ generate skeletons
→ finalize items
→ repair/validate
→ write outputs
→ complete report
```

The current output stage already writes:

- `items.ndjson`
- `manifest.csv`
- validation report
- checksums
- SQL batches
- DBC outputs
- placement/audit CSV files
- README

Use those outputs.

## 11. Python changes required for desktop hosting

### 11.1 Configurable Data directory

The current module-level `DATA_DIR = ROOT / 'Data'` behavior is not sufficient for an installed GUI.

Add:

```text
--data-dir PATH
```

CLI default remains the existing `ROOT / Data`.

Refactor default source resolution so all default DBC/SQL paths derive from the resolved runtime Data directory.

Do not leave encounter-only defaults hardcoded to the old module-level `DATA_DIR`.

Functions such as optional gameobject resolution must receive/use the runtime Data directory.

### 11.2 Configurable output root

Add:

```text
--output-root PATH
```

CLI default remains `ROOT`, preserving current command-line behavior.

Change runtime output setup from conceptually:

```python
OUT = ROOT / f"generated-{SEED}"
```

to:

```python
output_root = Path(args.output_root).expanduser().resolve()
OUT = output_root / f"generated-{SEED}"
```

Tauri always passes a writable user folder.

### 11.3 Explicit loot destination CLI control

The non-interactive CLI currently needs a clean way for Tauri to express the same selection as the interactive workflow.

Add:

```text
--loot-destinations [world] [dungeon] [raid]
```

Semantics:

- option absent: preserve current default, all destinations
- option present with values: use exactly those values
- option present with zero values: no loot insertion

Keep validation inside `configure_runtime`.

### 11.4 JSONL UI mode

Add:

```text
--event-stream jsonl
```

Implement `JsonLineUI` with the same public methods as the existing terminal UIs.

Event envelope:

```json
{
  "type": "phase",
  "timestamp": "2026-09-15T06:00:00.000Z",
  "payload": {}
}
```

Supported event types:

```text
banner
startup
startup_status
configure
source_check
phase
progress
status
discovery
phase_done
validation
complete
error
cancelled
```

Example progress event:

```json
{
  "type": "progress",
  "payload": {
    "phase": "Finalizing generated items",
    "completed": 45000,
    "total": 100000,
    "current": "Mage",
    "class_name": "Mage",
    "class_completed": 5000,
    "class_total": 10000
  }
}
```

Example discovery event:

```json
{
  "type": "discovery",
  "payload": {
    "kind": "legendary",
    "title": "Example Legendary",
    "detail": "Mage • Level 80 • ilvl 245 • 2 sockets"
  }
}
```

Example completion event:

```json
{
  "type": "complete",
  "payload": {
    "elapsed_seconds": 123.45,
    "output_dir": "C:\\Users\\...\\generated-1234567890",
    "report": {}
  }
}
```

`JsonLineUI.progress()` must throttle events. Target at most about 10–20 progress events per second and always emit phase completion.

Write JSONL events to stdout only. Human diagnostics may go to stderr in JSONL mode.

### 11.5 Source inspection mode

Add a fast sidecar command:

```text
--inspect-sources
--data-dir PATH
```

When paired with JSONL or a dedicated `--json`, output a single structured source-manifest object and exit without loading the expensive generation catalogs.

This keeps Python as the authoritative list of required/optional source files and prevents the Rust/frontend source list from drifting.

## 12. Rust/Tauri backend responsibilities

Rust owns:

- app data paths
- SQLite initialization/migrations
- saved settings
- native folder actions when useful
- spawning the generator sidecar
- child process lifecycle/cancellation
- parsing Python JSONL
- relaying typed Tauri events
- successful-run history import
- Library queries
- opening pack folders
- generation concurrency lock

Only one generation may run at a time in v1.

Do not allow the React frontend to spawn arbitrary commands.

Use Rust-side `tauri_plugin_shell::ShellExt` and the configured sidecar.

## 13. Frontend/backend contract

### Tauri commands

Create typed commands conceptually equivalent to:

```rust
#[tauri::command]
async fn get_app_state(...) -> Result<AppStateDto, String>;

#[tauri::command]
async fn inspect_sources(
    data_dir: String
) -> Result<SourceInspection, String>;

#[tauri::command]
async fn choose_data_dir(...) -> Result<Option<String>, String>;

#[tauri::command]
async fn choose_output_root(...) -> Result<Option<String>, String>;

#[tauri::command]
async fn start_generation(
    request: GenerationRequest
) -> Result<RunStartResponse, String>;

#[tauri::command]
async fn cancel_generation(...) -> Result<(), String>;

#[tauri::command]
async fn list_packs(
    query: PackQuery
) -> Result<Vec<PackSummary>, String>;

#[tauri::command]
async fn get_pack(
    pack_id: String
) -> Result<PackDetail, String>;

#[tauri::command]
async fn list_pack_items(
    query: ItemQuery
) -> Result<PagedItems, String>;

#[tauri::command]
async fn get_item(
    pack_id: String,
    entry: i64
) -> Result<ItemDetail, String>;

#[tauri::command]
async fn delete_pack_history(
    pack_id: String
) -> Result<(), String>;

#[tauri::command]
async fn open_pack_folder(
    pack_id: String
) -> Result<(), String>;
```

### Generator run events

Rust emits frontend events under a single channel:

```text
generator://event
```

Payload:

```ts
export type GeneratorEvent =
  | { type: "phase"; payload: PhaseEvent }
  | { type: "progress"; payload: ProgressEvent }
  | { type: "source_check"; payload: SourceCheckEvent }
  | { type: "discovery"; payload: DiscoveryEvent }
  | { type: "validation"; payload: ValidationEvent }
  | { type: "complete"; payload: CompleteEvent }
  | { type: "error"; payload: ErrorEvent }
  | { type: "cancelled"; payload: CancelledEvent };
```

## 14. Proposed repository layout

Do not move the generator until the GUI works. Minimize churn.

```text
/
├─ generate_pack.py
├─ Data/                              # development/default source folder
├─ packaging/
│  ├─ wotlk_generator.spec
│  └─ build_sidecar.ps1
├─ scripts/
│  └─ prepare_sidecar.ps1
├─ src/                               # React frontend
│  ├─ main.tsx
│  ├─ App.tsx
│  ├─ app.css
│  ├─ types/
│  │  ├─ generator.ts
│  │  ├─ library.ts
│  │  └─ settings.ts
│  ├─ lib/
│  │  └─ tauri.ts
│  ├─ store/
│  │  └─ forgeStore.ts
│  ├─ components/
│  │  ├─ layout/
│  │  │  ├─ AppShell.tsx
│  │  │  └─ RunSummary.tsx
│  │  ├─ common/
│  │  └─ forge/
│  └─ pages/
│     ├─ SourcesPage.tsx
│     ├─ GenerationPage.tsx
│     ├─ AdvancedPage.tsx
│     ├─ ForgeProgressPage.tsx
│     ├─ CompletionPage.tsx
│     ├─ LibraryPage.tsx
│     └─ PackDetailPage.tsx
├─ src-tauri/
│  ├─ Cargo.toml
│  ├─ tauri.conf.json
│  ├─ capabilities/
│  │  └─ default.json
│  ├─ binaries/
│  │  └─ wotlk-generator-x86_64-pc-windows-msvc.exe
│  ├─ migrations/
│  │  └─ 0001_init.sql
│  └─ src/
│     ├─ main.rs
│     ├─ lib.rs
│     ├─ app_state.rs
│     ├─ generator.rs
│     ├─ history.rs
│     ├─ settings.rs
│     ├─ sources.rs
│     └─ dto.rs
├─ tests/
│  └─ python/
│     ├─ test_json_ui.py
│     ├─ test_runtime_paths.py
│     └─ test_source_inspection.py
└─ package.json
```

---

# Implementation Tasks

## Task 1: Protect the Python generator with integration tests before GUI changes

**Files:**
- Create: `tests/python/test_runtime_paths.py`
- Create: `tests/python/test_json_ui.py`
- Create: `tests/python/test_source_inspection.py`
- Modify later: `generate_pack.py`

**Interfaces:**
- Consumes: current `parse_args`, `configure_runtime`, UI abstraction
- Produces: regression coverage for new desktop-hosting hooks

- [ ] **Step 1: Add a test proving CLI default behavior remains unchanged**

```python
from pathlib import Path
import generate_pack as gp

def test_default_data_dir_remains_script_data_dir():
    args = gp.parse_args([])
    assert Path(args.data_dir).resolve() == (gp.ROOT / "Data").resolve()
```

This test will initially fail because `--data-dir` does not exist yet.

- [ ] **Step 2: Add an output-root parsing test**

```python
def test_output_root_accepts_external_directory(tmp_path):
    args = gp.parse_args(["--output-root", str(tmp_path)])
    assert args.output_root == tmp_path
```

- [ ] **Step 3: Add loot-destination parsing tests**

```python
def test_loot_destinations_can_be_empty():
    args = gp.parse_args(["--loot-destinations"])
    assert args.loot_destinations == []

def test_loot_destinations_accept_subset():
    args = gp.parse_args(["--loot-destinations", "world", "raid"])
    assert args.loot_destinations == ["world", "raid"]
```

- [ ] **Step 4: Add JSONL UI serialization test**

```python
import io, json

def test_json_line_ui_emits_one_json_object_per_line():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)
    ui.phase("Generating item skeletons", total=100, detail="test")
    event = json.loads(stream.getvalue().strip())
    assert event["type"] == "phase"
    assert event["payload"]["total"] == 100
```

- [ ] **Step 5: Run the tests and verify the expected failures**

Run:

```bash
pytest tests/python -v
```

Expected: failures for the not-yet-implemented desktop hosting options/classes.

- [ ] **Step 6: Commit tests**

```bash
git add tests/python
git commit -m "test: define desktop hosting contract for generator"
```

## Task 2: Make Data and output paths runtime-configurable

**Files:**
- Modify: `generate_pack.py`
- Test: `tests/python/test_runtime_paths.py`

**Interfaces:**
- Produces:
  - `args.data_dir: Path`
  - `args.output_root: Path`
  - runtime default source resolution based on `data_dir`

- [ ] **Step 1: Add CLI arguments**

Add to `parse_args`:

```python
parser.add_argument(
    "--data-dir",
    type=Path,
    default=DATA_DIR,
    metavar="PATH",
    help="Directory containing default WotLK DBC and SQL sources."
)
parser.add_argument(
    "--output-root",
    type=Path,
    default=ROOT,
    metavar="PATH",
    help="Parent directory for generated-<seed> output folders."
)
```

- [ ] **Step 2: Refactor default source resolution**

Introduce:

```python
def data_source(data_dir, filename):
    return Path(data_dir).expanduser().resolve() / filename

def resolve_source(explicit, data_dir, filename):
    if explicit is not None:
        return Path(explicit).expanduser().resolve()
    return data_source(data_dir, filename)
```

Change parser defaults for Data-backed source arguments to `None`, then resolve them in `configure_runtime`.

Do the same for encounter files that currently use module-level defaults.

- [ ] **Step 3: Make `_default_item_dbc_sources` accept `data_dir`**

```python
def _default_item_dbc_sources(data_dir=DATA_DIR):
    data_dir = Path(data_dir)
    sources = [data_dir / "Item.dbc"]
    custom = data_dir / "Item.custom.dbc"
    if custom.is_file():
        sources.append(custom)
    return sources
```

- [ ] **Step 4: Make optional gameobject source functions honor runtime Data dir**

Ensure both:

```python
describe_optional_gameobject_sources(..., data_dir=data_dir)
resolve_optional_gameobject_sources(..., data_dir=data_dir)
```

use the selected folder.

- [ ] **Step 5: Change runtime output root**

Inside `configure_runtime`:

```python
output_root = Path(args.output_root).expanduser().resolve()
OUT = output_root / f"generated-{SEED}"
SQLDIR = OUT / "sql"
```

- [ ] **Step 6: Run path tests**

```bash
pytest tests/python/test_runtime_paths.py -v
```

Expected: PASS.

- [ ] **Step 7: Run a CLI smoke test with the original defaults**

```bash
python generate_pack.py --help
```

Confirm existing options remain present and the new options are additive.

- [ ] **Step 8: Commit**

```bash
git add generate_pack.py tests/python/test_runtime_paths.py
git commit -m "feat: support configurable data and output roots"
```

## Task 3: Add explicit loot destination arguments

**Files:**
- Modify: `generate_pack.py`
- Test: `tests/python/test_runtime_paths.py`

**Interfaces:**
- Produces: `args.loot_destinations: list[str] | None`

- [ ] **Step 1: Add the parser option**

```python
parser.add_argument(
    "--loot-destinations",
    nargs="*",
    choices=("world", "dungeon", "raid"),
    default=None,
    metavar="DEST",
    help="Loot insertion destinations. Pass the option with no values to disable loot insertion."
)
```

- [ ] **Step 2: Preserve old default behavior**

At runtime:

```python
raw_destinations = getattr(args, "loot_destinations", None)
LOOT_DESTINATIONS = (
    set(DEFAULT_LOOT_DESTINATIONS)
    if raw_destinations is None
    else set(raw_destinations)
)
```

- [ ] **Step 3: Keep interactive setup compatible**

Interactive setup may continue assigning the chosen destination set directly.

- [ ] **Step 4: Run focused tests**

```bash
pytest tests/python/test_runtime_paths.py -v
```

- [ ] **Step 5: Commit**

```bash
git add generate_pack.py tests/python/test_runtime_paths.py
git commit -m "feat: expose loot destinations to noninteractive clients"
```

## Task 4: Add structured JSONL generator events

**Files:**
- Modify: `generate_pack.py`
- Test: `tests/python/test_json_ui.py`

**Interfaces:**
- Produces: one JSON object per stdout line in `--event-stream jsonl` mode

- [ ] **Step 1: Add `--event-stream`**

```python
parser.add_argument(
    "--event-stream",
    choices=("none", "jsonl"),
    default="none",
    help="Emit machine-readable generator events."
)
```

- [ ] **Step 2: Implement `JsonLineUI`**

It must implement the same methods consumed by `main()` and generation helpers.

Use:

```python
class JsonLineUI(PlainTerminalUI):
    def __init__(self, stream=None):
        super().__init__(stream=stream or sys.stdout, animations=False, show_items=False)
        self._phase = ""
        self._last_emit = 0.0

    def _emit(self, event_type, payload=None):
        record = {
            "type": event_type,
            "timestamp": datetime.now().astimezone().isoformat(),
            "payload": payload or {},
        }
        self.stream.write(json.dumps(record, ensure_ascii=False, default=str) + "\n")
        self.stream.flush()
```

Do not copy Rich formatting into JSON.

- [ ] **Step 3: Add progress throttling**

Allow immediate emission when:

- first progress event
- percentage changes
- class changes
- phase completes
- at least 50–100 ms has elapsed since last emitted progress event

Do not emit 100,000 progress lines.

- [ ] **Step 4: Emit discovery events using existing `notable_item_event`**

```python
def item(self, item):
    event = notable_item_event(item)
    if event:
        self._emit("discovery", event)
```

Retain existing set deduplication behavior.

- [ ] **Step 5: Select JSON UI in the UI factory**

```python
if getattr(args, "event_stream", "none") == "jsonl":
    return JsonLineUI(stream=stream)
```

- [ ] **Step 6: Make `complete` include report, output path, and elapsed seconds**

- [ ] **Step 7: Make `error` emit structured error JSON**

- [ ] **Step 8: Run tests**

```bash
pytest tests/python/test_json_ui.py -v
```

- [ ] **Step 9: Run an end-to-end small generation in JSONL mode when fixture Data is available**

```bash
python generate_pack.py \
  --number 10 \
  --event-stream jsonl \
  --data-dir Data \
  --output-root .tmp-output
```

Every stdout line must parse with `json.loads`.

- [ ] **Step 10: Commit**

```bash
git add generate_pack.py tests/python/test_json_ui.py
git commit -m "feat: emit structured generator events for desktop clients"
```

## Task 5: Add source-inspection mode

**Files:**
- Modify: `generate_pack.py`
- Test: `tests/python/test_source_inspection.py`

**Interfaces:**
- Produces: `inspect_source_directory(data_dir) -> dict`

- [ ] **Step 1: Extract the source manifest from the interactive table constants**

```python
def inspect_source_directory(data_dir):
    data_dir = Path(data_dir).expanduser().resolve()
    rows = []
    for kind, names in INTERACTIVE_REQUIRED_DATA_FILES.items():
        for name in names:
            path = data_dir / name
            rows.append({
                "kind": kind,
                "name": name,
                "required": True,
                "found": path.is_file(),
                "path": str(path),
            })
    for kind, names in INTERACTIVE_OPTIONAL_DATA_FILES.items():
        for name in names:
            path = data_dir / name
            rows.append({
                "kind": kind,
                "name": name,
                "required": False,
                "found": path.is_file(),
                "path": str(path),
            })
    return {
        "data_dir": str(data_dir),
        "ready": all(row["found"] for row in rows if row["required"]),
        "files": rows,
    }
```

- [ ] **Step 2: Add `--inspect-sources`**

When used, print one JSON object and exit before catalog loading/generation.

- [ ] **Step 3: Test missing and complete temp directories**

- [ ] **Step 4: Commit**

```bash
git add generate_pack.py tests/python/test_source_inspection.py
git commit -m "feat: add machine-readable source inspection"
```

## Task 6: Scaffold Tauri 2 + React without touching generator behavior

**Files:**
- Create: standard Vite React TypeScript project files
- Create: `src-tauri/*`
- Create: `src/*`

**Interfaces:**
- Produces: a Windows Tauri app shell that launches with placeholder pages

- [ ] **Step 1: Scaffold Tauri 2 + React + TypeScript**

Use the current Tauri 2 tooling.

- [ ] **Step 2: Add plugins**

Required:

```text
tauri-plugin-shell
tauri-plugin-dialog
```

Use native Rust commands for sensitive operations; do not expose arbitrary shell execution to the frontend.

- [ ] **Step 3: Create route/tab shell**

Implement the four tabs:

```text
Sources
Generation
Advanced
Library
```

- [ ] **Step 4: Add placeholder `RunSummary` and disabled Forge button**

- [ ] **Step 5: Run frontend tests and Tauri compile**

```bash
npm test
cargo check --manifest-path src-tauri/Cargo.toml
```

- [ ] **Step 6: Commit**

```bash
git add package.json src src-tauri
git commit -m "feat: scaffold WotLK Item Forge desktop shell"
```

## Task 7: Package Python generator as a Windows sidecar

**Files:**
- Create: `packaging/wotlk_generator.spec`
- Create: `packaging/build_sidecar.ps1`
- Modify: `src-tauri/tauri.conf.json`
- Modify: `src-tauri/Cargo.toml`

**Interfaces:**
- Produces: `src-tauri/binaries/wotlk-generator-<target-triple>.exe`

- [ ] **Step 1: Create PyInstaller spec**

The sidecar must include the Python standard library and any required generator dependencies, but Data files remain external.

- [ ] **Step 2: Build the sidecar**

Example PowerShell flow:

```powershell
py -m pip install pyinstaller
pyinstaller packaging/wotlk_generator.spec --noconfirm
```

- [ ] **Step 3: Copy/rename for Tauri target triple**

For Windows x64:

```text
src-tauri/binaries/wotlk-generator-x86_64-pc-windows-msvc.exe
```

- [ ] **Step 4: Configure `externalBin`**

```json
{
  "bundle": {
    "externalBin": ["binaries/wotlk-generator"]
  }
}
```

- [ ] **Step 5: Add CI/build-script validation that the sidecar exists before Tauri packaging**

- [ ] **Step 6: Commit**

```bash
git add packaging src-tauri
git commit -m "build: package generator as Tauri sidecar"
```

## Task 8: Build Rust generator process manager

**Files:**
- Create: `src-tauri/src/generator.rs`
- Create: `src-tauri/src/dto.rs`
- Modify: `src-tauri/src/lib.rs`
- Test: Rust unit tests inside `generator.rs` or `src-tauri/tests/generator_events.rs`

**Interfaces:**
- Consumes: `GenerationRequest`
- Produces: `generator://event`
- Owns: only active child process

- [ ] **Step 1: Define request DTO**

Include:

```rust
#[derive(Debug, Clone, serde::Deserialize, serde::Serialize)]
#[serde(rename_all = "camelCase")]
pub struct GenerationRequest {
    pub data_dir: String,
    pub output_root: String,
    pub item_count: u32,
    pub class_name: Option<String>,
    pub loot_destinations: Vec<String>,
    pub loot_chance: f64,
    pub seed: Option<String>,
    pub disabled_features: Vec<String>,
    pub set_rate: f64,
    pub set_min_level: u32,
    pub set_size: u32,
    pub spell_effect_rate_multiplier: f64,
    pub proc_rate_multiplier: f64,
    pub on_use_rate_multiplier: f64,
    pub effect_ilvl_window: u32,
    pub socket_bonus_rate: f64,
    pub disenchant_rate: f64,
    pub max_special_effects: u32,
    pub item_dbc_overwrite: bool,
    pub verbose_audit: bool,
}
```

- [ ] **Step 2: Convert request to sidecar args in Rust**

Never construct a single shell string. Build an argument vector.

- [ ] **Step 3: Spawn using Tauri's Rust-side shell plugin**

Use `ShellExt::sidecar("wotlk-generator")`.

- [ ] **Step 4: Parse each stdout line as JSON**

Reject malformed stdout as a protocol error and preserve the offending line in diagnostics.

- [ ] **Step 5: Emit typed frontend events**

Emit only parsed JSON payloads.

- [ ] **Step 6: Store the child handle in managed state**

Use an async mutex and prevent concurrent runs.

- [ ] **Step 7: Implement cancellation**

Kill the active child and clear state.

- [ ] **Step 8: Test event parsing independently of a real child process**

- [ ] **Step 9: Commit**

```bash
git add src-tauri/src
git commit -m "feat: manage generator sidecar and stream typed events"
```

## Task 9: Implement settings and source selection

**Files:**
- Create: `src-tauri/src/settings.rs`
- Create: `src-tauri/src/sources.rs`
- Create: `src/types/settings.ts`
- Create: `src/pages/SourcesPage.tsx`
- Create: `src/lib/tauri.ts`
- Test: Rust settings tests + React page tests

**Interfaces:**
- Produces:
  - saved Data directory
  - saved output root
  - source inspection result

- [ ] **Step 1: Initialize app-data storage**

Settings may live in the same SQLite DB introduced in Task 12. Until then, use an in-memory repository abstraction in tests so this task is not blocked on the DB implementation.

- [ ] **Step 2: Implement auto-discovery**

Rules:

```text
explicit saved valid path → use it
else valid application-sibling Data → use it
else unconfigured
```

Once the user chooses a directory, persist it.

- [ ] **Step 3: Use Tauri dialog plugin for directory selection**

Use a directory picker, not free-form path entry as the primary UI.

- [ ] **Step 4: Call sidecar `--inspect-sources`**

Render returned manifest.

- [ ] **Step 5: Add Rescan, Open Folder, Reset Auto-Detect**

- [ ] **Step 6: Disable Forge when required source readiness is false**

- [ ] **Step 7: Commit**

```bash
git add src src-tauri
git commit -m "feat: add persistent source selection and validation"
```

## Task 10: Implement Generation and Advanced settings pages

**Files:**
- Create: `src/pages/GenerationPage.tsx`
- Create: `src/pages/AdvancedPage.tsx`
- Create: `src/store/forgeStore.ts`
- Create: `src/types/generator.ts`
- Create tests for both pages

**Interfaces:**
- Produces: validated `GenerationRequest`

- [ ] **Step 1: Define TypeScript request type matching Rust exactly**

- [ ] **Step 2: Add item-count and class constraints**

Rules:

```text
All Classes: 1..200000
Single Class: 1..20000
```

- [ ] **Step 3: Add loot controls and loot-chance validation**

- [ ] **Step 4: Add automatic/custom seed control**

- [ ] **Step 5: Add output-root picker**

- [ ] **Step 6: Add Advanced feature toggles**

Translate enabled UI switches into Python `disabled_features`.

- [ ] **Step 7: Add numeric advanced options and Restore Defaults**

- [ ] **Step 8: Test that the composed request matches defaults**

Example assertion:

```ts
expect(buildGenerationRequest(state)).toMatchObject({
  itemCount: 100000,
  className: null,
  lootDestinations: ["world", "dungeon", "raid"],
  lootChance: 2,
  setRate: 0.2,
  setMinLevel: 20,
  setSize: 5,
  maxSpecialEffects: 1,
});
```

- [ ] **Step 9: Commit**

```bash
git add src
git commit -m "feat: add generation and advanced configuration"
```

## Task 11: Implement live Forge Progress and Completion views

**Files:**
- Create: `src/pages/ForgeProgressPage.tsx`
- Create: `src/pages/CompletionPage.tsx`
- Create: `src/components/forge/*`
- Modify: `src/store/forgeStore.ts`
- Tests: React event-state tests

**Interfaces:**
- Consumes: `generator://event`
- Produces: live run state + completion actions

- [ ] **Step 1: Register one Tauri event listener**

- [ ] **Step 2: Reduce events into run state**

Maintain:

```ts
type RunState = {
  status: "idle" | "starting" | "running" | "validating" | "writing" | "complete" | "failed" | "cancelled";
  phase?: string;
  phaseDetail?: string;
  completed: number;
  total: number;
  elapsedSeconds: number;
  current?: string;
  classProgress: Record<string, { completed: number; total: number }>;
  discoveries: DiscoveryEvent[];
  validation?: ValidationEvent;
  completion?: CompleteEvent;
  error?: string;
};
```

- [ ] **Step 3: Cap visible discovery history**

Keep the latest ~100 in frontend memory, with the UI showing a smaller recent subset.

- [ ] **Step 4: Add cancel workflow**

- [ ] **Step 5: Add completion summary using Python's report**

- [ ] **Step 6: Add Open Pack Folder, View in Library, Forge Another Pack**

`View in Library` becomes active after the history import succeeds.

- [ ] **Step 7: Commit**

```bash
git add src
git commit -m "feat: add live forge progress and completion views"
```

## Task 12: Add SQLite history database and migrations

**Files:**
- Create: `src-tauri/migrations/0001_init.sql`
- Create: `src-tauri/src/history.rs`
- Modify: `src-tauri/src/lib.rs`
- Modify: `src-tauri/Cargo.toml`
- Tests: `src-tauri/tests/history.rs`

**Interfaces:**
- Produces: `HistoryRepository`

Recommended Rust shape:

```rust
pub struct HistoryRepository {
    db_path: PathBuf,
}

impl HistoryRepository {
    pub fn initialize(&self) -> Result<(), HistoryError>;
    pub fn import_pack(&self, import: PackImport) -> Result<String, HistoryError>;
    pub fn list_packs(&self, query: PackQuery) -> Result<Vec<PackSummary>, HistoryError>;
    pub fn get_pack(&self, pack_id: &str) -> Result<PackDetail, HistoryError>;
    pub fn list_items(&self, query: ItemQuery) -> Result<PagedItems, HistoryError>;
    pub fn get_item(&self, pack_id: &str, entry: i64) -> Result<ItemDetail, HistoryError>;
    pub fn delete_pack(&self, pack_id: &str) -> Result<(), HistoryError>;
}
```

- [ ] **Step 1: Add `rusqlite` with bundled SQLite**

Use a bundled SQLite feature so the app does not depend on a system SQLite installation.

- [ ] **Step 2: Add migration SQL exactly matching Schema v1**

- [ ] **Step 3: Initialize DB under Tauri app-local/app-data directory**

- [ ] **Step 4: Enable foreign keys, WAL, NORMAL synchronous**

- [ ] **Step 5: Write CRUD tests against a temporary SQLite DB**

Test:
- pack insertion
- item insertion
- cascade delete
- pagination
- class/quality/name filters
- output path preservation

- [ ] **Step 6: Commit**

```bash
git add src-tauri
git commit -m "feat: add persistent pack and item history database"
```

## Task 13: Import every successful generated pack into Library

**Files:**
- Modify: `src-tauri/src/generator.rs`
- Modify: `src-tauri/src/history.rs`
- Test: `src-tauri/tests/history_import.rs`

**Interfaces:**
- Consumes:
  - `validation_report.json`
  - `items.ndjson`
  - `CHECKSUMS.txt`
  - original `GenerationRequest`
- Produces:
  - durable Library `pack_id`

- [ ] **Step 1: Add `PackImport`**

```rust
pub struct PackImport {
    pub generation_request: GenerationRequest,
    pub output_dir: PathBuf,
    pub completed_at: chrono::DateTime<chrono::Utc>,
}
```

- [ ] **Step 2: Parse report JSON and validate expected fields**

At minimum require:

```text
seed
total_items
selected_classes
loot_destinations
validation_errors
```

- [ ] **Step 3: Verify `items.ndjson` checksum**

If checksum file is absent, continue with a warning only if the generator version predates checksums. For the new bundled generator, checksum mismatch is an import failure.

- [ ] **Step 4: Stream NDJSON lines**

Pseudo-code:

```rust
let file = BufReader::new(File::open(items_path)?);
for line in file.lines() {
    let line = line?;
    let item: serde_json::Value = serde_json::from_str(&line)?;
    insert_item(&tx, pack_id, &item, &line)?;
    count += 1;
}
```

- [ ] **Step 5: Assert imported count equals report count**

```rust
if count != report.total_items {
    return Err(HistoryError::ItemCountMismatch {
        expected: report.total_items,
        actual: count,
    });
}
```

- [ ] **Step 6: Commit transaction**

- [ ] **Step 7: Emit `library_imported` frontend event containing pack ID**

- [ ] **Step 8: On import failure, preserve outputs and surface retry action**

- [ ] **Step 9: Commit**

```bash
git add src-tauri
git commit -m "feat: archive successful generations in persistent library"
```

## Task 14: Build Library pack browser

**Files:**
- Create: `src/pages/LibraryPage.tsx`
- Create: `src/types/library.ts`
- Modify: `src/lib/tauri.ts`
- Tests: `src/pages/LibraryPage.test.tsx`

**Interfaces:**
- Consumes: `list_packs`
- Produces: searchable pack history UI

- [ ] **Step 1: Add newest-first list**

- [ ] **Step 2: Add filters**

- [ ] **Step 3: Add output path existence indicator**

Statuses:

```text
Available
Missing
```

A missing output folder does not remove the pack from Library.

- [ ] **Step 4: Add pack actions**

- [ ] **Step 5: Add Remove From Library confirmation**

Copy must explicitly say generated files are not deleted.

- [ ] **Step 6: Commit**

```bash
git add src
git commit -m "feat: add persistent generated-pack library"
```

## Task 15: Build pack detail and item browser

**Files:**
- Create: `src/pages/PackDetailPage.tsx`
- Create: `src/components/library/ItemTable.tsx`
- Create: `src/components/library/ItemDetailDrawer.tsx`
- Modify: `src-tauri/src/history.rs`
- Tests: frontend pagination/filter tests + Rust query tests

**Interfaces:**
- Consumes:
  - `get_pack`
  - `list_pack_items`
  - `get_item`

- [ ] **Step 1: Add server-side/SQLite pagination**

Default page size: 100.

Do not send 100,000 items to React.

- [ ] **Step 2: Implement filters in SQL**

Use bound parameters only.

- [ ] **Step 3: Display quality semantically**

Suggested mapping:

```text
2 Uncommon
3 Rare
4 Epic
5 Legendary
```

Do not infer qualities outside known generator values without a fallback label.

- [ ] **Step 4: Add item detail drawer**

Parse and pretty-display archived `raw_json`.

- [ ] **Step 5: Add Regenerate With Same Settings**

Load `config_json` back into the Forge store, then navigate to Generation. Do not automatically start generation.

- [ ] **Step 6: Commit**

```bash
git add src src-tauri
git commit -m "feat: browse archived items and reuse pack settings"
```

## Task 16: Persist application settings in SQLite

**Files:**
- Modify: `src-tauri/src/settings.rs`
- Modify: `src-tauri/src/history.rs`
- Tests: settings persistence tests

**Interfaces:**
- Persists:
  - Data folder
  - output root
  - last Generation form values
  - last Advanced form values
  - reduced-motion preference if added

- [ ] **Step 1: Implement typed setting getters/setters over `app_settings`**

- [ ] **Step 2: Migrate temporary settings repository from Task 9 to SQLite**

- [ ] **Step 3: Validate stored paths on load**

Never silently replace an explicitly selected missing Data folder. Mark it missing and let the user choose.

- [ ] **Step 4: Commit**

```bash
git add src-tauri
git commit -m "feat: persist desktop preferences"
```

## Task 17: Polish desktop UX and accessibility

**Files:**
- Modify: `src/app.css`
- Modify relevant components/pages
- Tests: key interaction tests

- [ ] **Step 1: Apply final dark theme and rarity accents**

- [ ] **Step 2: Ensure keyboard focus styles**

- [ ] **Step 3: Add accessible labels to icon-only controls**

- [ ] **Step 4: Respect reduced motion**

- [ ] **Step 5: Verify layout at common desktop window sizes**

Target minimum practical window around 1100×700. Do not make the app unusable below that; allow scrolling.

- [ ] **Step 6: Commit**

```bash
git add src
git commit -m "style: polish WotLK Item Forge desktop experience"
```

## Task 18: End-to-end verification and Windows packaging

**Files:**
- Modify build scripts/config as needed
- Add: `docs/desktop-build.md`

**Interfaces:**
- Produces: installable/self-contained Windows build

- [ ] **Step 1: Run Python tests**

```bash
pytest tests/python -v
```

- [ ] **Step 2: Run frontend tests**

```bash
npm test -- --run
```

- [ ] **Step 3: Run Rust tests**

```bash
cargo test --manifest-path src-tauri/Cargo.toml
```

- [ ] **Step 4: Build sidecar**

```powershell
powershell -ExecutionPolicy Bypass -File packaging/build_sidecar.ps1
```

- [ ] **Step 5: Build Tauri release**

```bash
npm run tauri build
```

- [ ] **Step 6: Test on a clean Windows user profile without Python installed**

Verify:

- app launches
- Data folder picker works
- source inspection works
- 10-item generation succeeds
- normal-size generation can be started
- progress events render
- validation result renders
- output folder opens
- successful run appears in Library
- app restart preserves Library
- item search works
- deleting/moving output folder does not delete Library item history
- Remove From Library does not delete output files

- [ ] **Step 7: Test repeat generations**

Include:
- automatic seeds
- explicit seed
- single class
- all classes
- no loot destinations
- world only
- all loot destinations
- features disabled
- missing optional gameobject files

- [ ] **Step 8: Document build requirements for developers**

End users must still require none of them.

- [ ] **Step 9: Final commit**

```bash
git add .
git commit -m "release: complete self-contained WotLK Item Forge desktop app"
```

---

# Testing Strategy

## Python

The Python tests protect the generator boundary:

- old CLI behavior remains available
- runtime Data directory works
- runtime output root works
- loot destination argument works
- JSONL protocol is valid
- source inspection is authoritative
- deterministic seed generation is unchanged

Do not attempt to re-test every item-generation rule as part of the GUI conversion unless those tests already exist.

## Rust

Focus Rust tests on desktop-specific responsibility:

- argument construction
- event parsing
- one-run concurrency lock
- cancellation state
- settings persistence
- history transactions
- NDJSON streaming import
- checksum mismatch behavior
- pagination/filter SQL
- cascade deletion

## React

Focus UI tests on user behavior:

- required source status
- validation of item caps
- Advanced defaults
- run state event reduction
- cancellation controls
- completion actions
- Library search/filtering
- item pagination
- remove-history wording
- regenerate-with-settings flow

## End-to-End

A successful end-to-end test must prove this entire path:

```text
choose Data folder
→ sources pass
→ configure 10-item run
→ launch sidecar
→ receive phases/progress
→ validate
→ write pack
→ receive completion report
→ import Library history
→ open Library
→ inspect archived item
→ restart app
→ archived pack/item still exists
```

---

# Error Handling Requirements

## Source errors

Show missing files individually. Do not collapse everything into "generation failed."

## Generator errors

Display the structured Python error event and retain a copy in the run state.

## Sidecar crash

If process exits without a `complete` event:

```text
Generation failed because the generator process exited unexpectedly.
```

Include captured stderr in an expandable diagnostics section.

## Validation failure

Treat as generation failure. Do not import it as a successful Library pack.

Future versions may add failed-run history, but v1 stores successful packs only.

## Library import failure

Use distinct copy:

```text
Your pack was generated successfully, but WotLK Item Forge could not add it to the Library.
The generated files are safe.
```

Provide:

- Retry Library Import
- Open Pack Folder

## Missing historical output directory

Do not show an error banner. Show:

```text
Output files no longer found
```

Archived report/item data remains fully browsable.

---

# Security / Safety Boundaries

- React must never accept an arbitrary executable path.
- Rust invokes only the bundled configured sidecar.
- Use argument arrays, never shell-concatenated command strings.
- SQL query filters must use bound parameters.
- File deletion is out of scope for v1 Library history actions.
- `Remove From Library` deletes only SQLite rows.
- Keep Tauri capabilities minimal.
- Do not grant broad shell execution to frontend JavaScript.
- Native folder picker paths should be passed to dedicated Rust commands.

---

# Performance Requirements

The app must remain responsive during 100,000-item and 200,000-item runs.

Required practices:

- sidecar runs outside the webview process
- Rust reads process output asynchronously
- JSONL progress is throttled
- no per-item IPC
- Library import streams NDJSON
- Library insertion uses a single SQLite transaction + prepared statement
- item list is paginated in SQL
- React never holds the whole item archive in memory
- indexes from Schema v1 are created before normal Library use

Suggested initial item page size:

```text
100
```

Suggested maximum page size:

```text
500
```

---

# Explicit Non-Goals for v1

Do not add these unless separately requested:

- macOS/Linux packaging
- cloud sync
- accounts
- online item sharing
- direct MySQL/AzerothCore database import
- automatic server installation
- arbitrary multi-class selection
- item editing
- manual item creation
- deleting generated pack folders from Library
- background auto-generation
- plugin system
- auto-updater
- telemetry
- FTS5/trigram search optimization before ordinary indexed search is shown insufficient

---

# Codex Starting Instructions

1. Read this document completely before editing.
2. Read `generate_pack.py`, especially:
   - UI classes
   - `parse_args`
   - `configure_runtime`
   - `write_outputs`
   - `main`
3. Do not begin with React styling.
4. Begin with **Tasks 1–5** so the Python generator has a stable machine-facing interface.
5. Keep each task independently testable and commit after each task.
6. After JSONL and runtime path tests pass, scaffold Tauri.
7. Do not rewrite item-generation algorithms during desktop conversion.
8. Treat every difference in generated item output for the same seed/source configuration as a regression unless the difference is intentionally required by this document.
9. Before claiming completion, run the entire verification matrix in Task 18.

## First milestone

The first milestone is complete when this command works from a terminal:

```bash
python generate_pack.py \
  --number 10 \
  --data-dir "C:\path\to\Data" \
  --output-root "C:\path\to\Packs" \
  --loot-destinations world dungeon raid \
  --event-stream jsonl
```

and:

- every stdout line is valid JSON
- generation behavior is unchanged
- outputs land under the selected output root
- the final event contains the report and output path

Only after that milestone should Codex wire the generator into Tauri.

## Second milestone

The second milestone is complete when the Tauri development app can:

```text
select Data folder
→ inspect sources
→ configure 10 items
→ start bundled/dev sidecar
→ show progress
→ cancel a run
→ show completion
```

## Third milestone

The third milestone is complete when:

```text
successful generation
→ SQLite history import
→ Library pack appears
→ item can be searched/opened
→ app restart
→ same pack and item remain available
```

That is the minimum bar for the persistent-memory requirement.
