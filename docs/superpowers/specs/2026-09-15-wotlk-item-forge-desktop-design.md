# WotLK Item Forge Desktop Application — Design Specification

Date: 2026-09-15
Status: Approved design
Target platform: Windows 10/11 x64

## 1. Purpose

Build a polished Windows desktop application around the existing AzerothCore WotLK item generator without rewriting or duplicating its generation logic.

The application will turn the current terminal-driven workflow into a full desktop tool with six primary areas:

1. Forge
2. Sources
3. Library
4. Reports
5. History
6. Settings

The existing Python generator remains the authoritative generation engine. The desktop application owns presentation, local indexing, settings, run history, and report browsing.

## 2. Core design goals

- Preserve generator behavior and deterministic output.
- Avoid a risky full-port of the generator.
- Present every common generator option through a polished GUI.
- Keep advanced options available without overwhelming the default Forge screen.
- Provide live progress without scraping terminal formatting.
- Make generated items searchable across runs.
- Turn CSV/JSON reports into useful in-app views while preserving access to original files.
- Preserve CLI operation for automation, testing, and debugging.
- Package as a normal Windows application requiring no separate Python installation.
- Keep the first release read-only with respect to generated items and the live AzerothCore database.

## 3. Existing generator constraints and opportunities

The supplied generator already has several properties that make it well suited to a desktop shell:

- Generation is split into distinct phases: runtime configuration, skeleton generation, item finalization, validation, and output writing.
- Presentation is already separated behind UI callback methods such as phase, progress, status, event, validation, complete, and error.
- Rich is optional and terminal presentation is not required for the generator to function.
- Interactive configuration already exposes expansion, classes, item count, magic effects, sockets, socket bonuses, sets, legendaries, disenchanting, and loot destinations.
- The generator already writes structured outputs including items.ndjson, manifest.csv, validation_report.json, placement reports, set reports, encounter reports, checksums, SQL, and DBC files.

Two packaging assumptions must be removed before desktop distribution:

1. Generated output currently derives from the script directory rather than a user-writable output root.
2. The source-cache key currently hashes a loose generate_pack.py file, which is not a safe assumption after compiling the engine.

## 4. Recommended architecture

### 4.1 Desktop shell

Use Tauri 2 for the Windows desktop application.

Frontend:
- React
- TypeScript
- Vite
- CSS variables/tokens for the visual system

Desktop/backend responsibilities:
- Native file/folder dialogs
- Launching and supervising the bundled generator engine
- Reading structured progress events
- Managing local SQLite data
- Opening output folders/files
- Persisting application settings
- Managing run history

### 4.2 Generator engine

Keep the current Python generator as the authoritative engine.

Package it as an internal Windows sidecar executable using Nuitka.

The engine remains callable directly from the command line for:
- regression testing
- automation
- troubleshooting
- CI or scripted generation

The GUI must never reimplement generator formulas, validation rules, DBC logic, loot logic, item naming logic, or output generation.

### 4.3 Process boundary

The desktop application launches the engine as a child process with explicit command-line arguments.

The engine emits newline-delimited JSON events on stdout in GUI mode.

stderr is reserved for diagnostics that are not part of the structured protocol.

This process boundary is intentionally simple and avoids:
- local HTTP ports
- background web servers
- embedding Python into the Rust process
- tightly coupling the UI to Python internals

## 5. Engine event protocol

Add a GUI event mode to the generator, for example `--ui json` or a dedicated equivalent.

Each stdout line in JSON mode represents one complete JSON object.

Required event families:

### configured
Contains resolved runtime configuration after validation of arguments and source discovery.

Suggested fields:
- seed
- number
- classes
- expansion
- magic_effects
- generate_sockets
- generate_legendaries
- disabled_features
- loot_destinations
- output_dir
- class_counts
- source summary

### phase
Fields:
- name
- detail
- total

### progress
Fields:
- completed
- total
- current
- class_name
- class_completed
- class_total

### status
Fields:
- message

### discovery
Fields:
- kind
- title
- detail
- optional item identity fields when available

### source_check
Fields:
- label
- path
- ok

### validation
Fields:
- error_count
- errors
- name_repair_count
- name_repairs

### complete
Fields:
- report summary
- elapsed
- output_dir

### error
Fields:
- stage where known
- message
- optional details

All event objects should also include a protocol version so future GUI/engine compatibility can be validated.

## 6. Run lifecycle

The desktop application models each run with the following states:

- idle
- checking_sources
- configuring
- generating_skeletons
- finalizing_items
- validating
- writing_output
- indexing_library
- complete
- failed
- cancelled

The GUI updates state from structured engine events and child-process state.

### Cancellation

The Forge screen includes Cancel Generation.

Cancellation terminates the engine child process and records the run as cancelled.

Cancelled or failed runs are not indexed into the Library as valid item collections.

Any partial diagnostic output that exists remains accessible from History.

## 7. Primary navigation

Persistent left navigation:

- Forge
- Sources
- Library
- Reports
- History
- Settings

Top application chrome includes:
- app identity
- current source-health indicator
- compact environment/version information where useful

## 8. Visual design system

The visual direction is a polished WoW development tool rather than a generic Windows form.

### Palette and surface language

- Deep navy/blue-black main canvas
- Slightly lighter panel surfaces
- Thin cool blue/steel borders
- Cyan/teal primary interaction color
- Restrained glows and soft technical/rune texture
- High contrast body text without pure-white overload

### Semantic colors

Use WoW-inspired rarity semantics only where meaningful:
- Uncommon: green
- Rare: blue
- Epic: purple
- Legendary: orange/gold

Additional event semantics:
- Sets: magenta/rune treatment
- Procs: cyan
- On-use effects: electric blue
- Success: green
- Warning: amber
- Failure: red

### Typography

- Monospaced or technical display type for headings, labels, badges, metadata, and numeric readouts
- Highly readable UI font for dense tables if needed
- Compact uppercase metadata labels

### Density

Default to information-dense but organized layouts.

Settings may expose Compact and Comfortable density modes.

## 9. Forge page

Forge is the primary workbench and has two main states.

### 9.1 Configure state

Visible controls:
- Expansion: Classic / TBC / Wrath / All
- Classes: multi-select for all supported classes
- Item count
- Magic effects
- Loot placement: World / Dungeon / Raid
- Generate sets
- Generate sockets
- Generate socket bonuses
- Generate legendaries
- Generate disenchant data
- Seed: auto or explicit

Primary action:
- Begin Forging

Readiness area before launch:
- required source count
- AzerothCore source state
- DBC baseline state
- output path writability
- clear blocking errors with link to Sources

### 9.2 Advanced options drawer

Expose power-user generator controls without crowding the default view.

Includes, where supported by the existing generator:
- set rate
- set minimum level
- set size
- spell-effect rate multiplier
- proc rate multiplier
- on-use rate multiplier
- effect item-level window
- socket-bonus rate
- disenchant rate
- maximum special effects
- strict expansion scoping
- loot chance
- verbose audit
- content manifest
- quest template source
- source overrides

### 9.3 Live Forge state

The configure form transforms in place rather than navigating away.

Display:
- current phase
- phase description
- overall progress
- completed/total item count
- elapsed time
- per-class progress when applicable
- current item/status text
- recent discoveries
- Cancel Generation

Discovery cards use semantic rarity/effect styling and may show compact item previews.

### 9.4 Completion state

Show:
- total generated items
- quality distribution
- sets count
- special effect counts
- validation state
- name repairs
- elapsed time
- output location

Actions:
- Browse Items
- View Reports
- Open Output Folder
- Forge Another Pack

Validation failures must never be presented as successful completion.

## 10. Sources page

Sources is a health dashboard.

### 10.1 AzerothCore source

Display:
- resolved root path
- discovery state
- source-script state
- encounter discovery state

Actions:
- Browse
- rescan

### 10.2 Required data

List every required DBC/SQL source with:
- status
- resolved path
- source origin
- size
- last modified time

### 10.3 Optional data

Show optional sources separately so absence is not visually treated as failure.

### 10.4 Source detail

Expanding a source row shows:
- absolute resolved path
- size
- modified timestamp
- origin: bundled Data directory or user override
- fingerprint where applicable
- compatibility with selected historical run when comparing source drift

### 10.5 Source cache

Display cache validity and age.

Actions:
- Rebuild Cache
- Clear Source Cache

## 11. Library page

Library is a read-only searchable index of successful generated items.

### 11.1 Storage strategy

The desktop app indexes successful runs into local SQLite after generation finishes.

The generator does not write directly to SQLite.

The original generated pack remains the authoritative output artifact.

### 11.2 Import source

Use `items.ndjson` as the primary item source because it contains full structured item objects.

Use manifests and placement reports to enrich searchable placement/report relationships where needed.

### 11.3 Search and filters

Support:
- text search
- run
- seed
- class
- role
- quality
- slot / kind
- required level
- item level
- set
- special-effect type
- socket count
- placement type
- entry ID

The list must be virtualized for large collections.

### 11.4 Item inspector

Open item details in a right-side inspector so the user can browse without page churn.

Sections:
- item identity
- rarity
- class/role
- required level
- item level
- stats
- weapon or armor values
- sockets
- socket bonus
- spell/effect package
- set membership and bonuses
- content/quest/encounter placement
- entry/display/reference IDs
- seed/run metadata

Actions:
- Copy ID
- Open Run
- Open Reports

### 11.5 Raw data

Provide a Raw Data tab showing the exact indexed JSON representation for troubleshooting.

### 11.6 Editing scope

Version 1 Library is strictly read-only.

Do not add post-generation editing because that could desynchronize SQL, DBCs, manifests, reports, and checksums.

A future Item Editor must be designed as a separate subsystem.

## 12. Reports page

Reports converts existing output files into readable in-app views while preserving access to raw files.

Tabs:
- Summary
- Validation
- World Loot
- Dungeons/Raids
- Sets
- Encounter Coverage
- Distribution
- Source Audit

### Summary

Show:
- item count
- quality distribution
- feature counts
- validation status
- name repairs
- elapsed time

### Validation

Show:
- pass/fail state
- validation errors
- name repairs

### Placement and encounter views

Use filterable, sortable tables for:
- world placement
- dungeon/raid placement
- encounter coverage
- difficulty comparisons
- distribution warnings

### Sets

Show generated sets and their pieces with links into Library.

### Raw files

Every report tab retains an Open Raw File action when a corresponding artifact exists.

## 13. History page

History records every attempted generation run.

### Run card fields

- start date/time
- status
- seed
- expansion
- selected classes
- item count
- elapsed time
- validation state
- output location

### Run detail

Store and display:
- unique run UUID
- generator seed
- exact generator configuration
- source fingerprints
- engine version/build
- protocol version
- start/end timestamps
- duration
- run state
- output directory
- report summary

### Regenerate

Regenerate does not immediately execute.

It loads the historical configuration into Forge for review.

### Source drift

When current source fingerprints differ from those used by a historical run, show a prominent warning and identify changed sources.

The user may still load the old configuration.

## 14. Settings page

### General

- default output directory
- default expansion
- default item count
- remember last Forge configuration

### Generator

- default loot chance
- default feature toggles
- advanced generation defaults
- strict expansion scoping

### Appearance

- animations
- reduce motion
- compact / comfortable density
- show discovery feed

### Paths

- AzerothCore source root
- Data directory
- custom source overrides

### Storage

- Library database location
- indexed item count
- run count
- clear Library index
- rebuild Library index
- clear source cache

Clearing the Library index must never delete generated output packs.

### About

- desktop app version
- generator engine version
- event protocol version
- database schema version

## 15. Local storage layout

Installed program resources belong under the normal application install location.

User-writable state belongs outside Program Files.

Recommended layout:

```text
%LOCALAPPDATA%\WotLK Item Forge\
  app.db
  settings.json
  logs\
  cache\

Documents\WotLK Item Forge\Packs\
  generated-<seed>\
```

The default pack directory is configurable.

## 16. Generator path changes required

### 16.1 Output root

Stop deriving output from the script/executable directory.

Add an explicit output-root or output-dir argument that works in both CLI and GUI modes.

The desktop app passes a user-writable destination.

CLI behavior may retain a reasonable backwards-compatible default when an output argument is omitted.

### 16.2 Resource/data discovery

Separate:
- bundled application resources
- user-selected source data
- user-writable application state

Do not assume all three are siblings of the compiled engine.

### 16.3 Cache engine identity

Replace hashing of a loose `generate_pack.py` file with an explicit engine build identity.

Recommended values:
- GENERATOR_VERSION
- ENGINE_BUILD_ID or build hash
- CACHE_SCHEMA_VERSION

The cache key should include the engine build identity and relevant source fingerprints.

## 17. SQLite model

A single local SQLite database owned by the desktop application.

Recommended tables:

### settings
Application-owned persistent settings when not stored in settings.json.

### runs
- id UUID primary key
- seed
- status
- started_at
- ended_at
- elapsed_ms
- output_dir
- engine_version
- engine_build_id
- protocol_version
- validation_error_count
- summary_json

### run_configuration
- run_id
- complete normalized configuration JSON

### run_sources
- run_id
- logical source name
- path
- fingerprint
- size
- modified timestamp

### generated_items
Core searchable columns plus raw_json.

Suggested indexed columns:
- run_id
- entry
- name
- class_name
- role
- quality
- required_level
- item_level
- kind
- weapon_kind
- inventory_type
- itemset
- special_effect_feature
- socket_count

### item_effects
Normalized spell/effect packages for filtering and detail display.

### item_sockets
Optional normalized socket rows if useful beyond socket_count.

### item_placements
Placement relationships from generated reports.

### report_index
Maps run/report type to original output files and import state.

## 18. Indexing rules

- Index only successfully generated and validated packs by default.
- Failed/cancelled runs remain in History but not the main Library item collection.
- Treat Library indexing as a separate post-generation stage.
- If indexing fails after generation succeeds, the pack remains successful.
- Show Retry Indexing.
- Rebuilding an index must read the generated pack rather than regenerate items.
- Duplicate run UUIDs must not create duplicate rows.

## 19. Failure behavior

### Generator failure

Record:
- failed state
- last known phase
- exit code
- structured error if available
- diagnostic stderr/log path
- partial output location if it exists

Actions:
- View Error
- Open Partial Output
- Copy Diagnostic Info
- Load Settings Into Forge

### Library indexing failure

Display generation success separately from indexing failure.

Do not conflate database/index failure with generator failure.

### Desktop crash / process supervision

The desktop backend owns the engine child process lifecycle.

Closing the application while a run is active must present a clear confirmation and terminate or deliberately preserve the child process according to the chosen close action. Default behavior for version 1 is to terminate the child process to avoid orphaned generators.

## 20. Security model

The app should not require administrator privileges for normal generation.

Required capabilities:
- read explicitly selected source directories/files
- write explicitly selected output/app-state directories
- launch the bundled generator sidecar
- open output files/folders on user request

Version 1 explicitly excludes:
- arbitrary shell execution from frontend code
- listening network services
- inbound ports
- automatic live database import
- silent modification of an AzerothCore database
- Library item editing

Frontend must render generated names/descriptions as text rather than executable HTML.

## 21. Packaging

### Windows installer

Primary release artifact:

`WotLK Item Forge Setup.exe`

Use Tauri's Windows packaging to provide:
- Start Menu entry
- application icon
- uninstall entry
- optional shortcuts as supported

Normal GUI launch must not display a console window.

### Generator sidecar

Compile the Python generator with Nuitka.

Development sequence:
1. standalone build
2. verify resources/data behavior
3. one-file or appropriate distributable engine format
4. bundle as Tauri sidecar

End users must not need to install:
- Python
- pip
- Node.js
- Rust
- Rich

### Development build

Maintain an easy-to-run development configuration with visible logs and uncompressed resources where practical.

## 22. Compatibility and reproducibility

A run is identified by a UUID, not only by seed.

The same seed may be reused with different:
- options
- source data
- engine versions

History therefore stores configuration and source fingerprints alongside the seed.

Regeneration warnings must surface source drift.

## 23. Testing strategy

### 23.1 Generator compatibility tests

Highest priority.

For a fixed fixture source set and fixed configuration:
- CLI mode and GUI/JSON-event mode must produce equivalent generator outputs.
- GUI mode must not alter item-generation behavior.

### 23.2 Golden-run regression test

Use a small deterministic fixture set with:
- fixed seed
- fixed configuration
- expected item counts
- expected report counts
- expected checksums for stable artifacts where appropriate

Any intentional generator behavior change must explicitly update the golden expectations.

### 23.3 Event bridge tests

Test:
- configured event
- phase transitions
- high-frequency progress
- class progress
- discoveries
- validation success
- validation failure
- structured error
- malformed JSON event handling
- nonzero process exit
- cancellation
- stderr logging

### 23.4 SQLite/index tests

Test:
- successful NDJSON import
- large import
- duplicate run protection
- search
- filters
- item detail relationships
- placement imports
- deleting/rebuilding index without deleting pack files
- retry after interrupted indexing

### 23.5 React/UI tests

Test:
- Forge validation/readiness
- disabled/enabled Begin Forging state
- advanced options
- progress rendering
- cancellation state
- completion state
- validation failure state
- source-health display
- Library filters
- item inspector
- Reports tabs
- History regenerate preload
- source-drift warning

### 23.6 Packaged Windows smoke test

On a clean Windows user profile:
1. install app
2. launch without Python installed
3. choose source directory
4. verify Sources health
5. generate a small pack
6. verify completion
7. browse an indexed item
8. open Reports
9. preload configuration from History
10. open output folder
11. uninstall

## 24. Performance requirements

- UI must remain responsive while the generator is running.
- Engine execution never occurs on the frontend/UI thread.
- Progress events may be received frequently, but frontend repainting should be throttled/coalesced.
- Library item lists must use virtualization.
- SQLite imports should use transactions and batched inserts.
- Searching 100,000 items from a run should feel effectively immediate for common indexed filters.
- Library architecture should remain usable with multiple runs totaling millions of indexed items.

## 25. Versioning

Maintain independent versions for:
- desktop app
- generator engine
- event protocol
- SQLite schema
- generator source cache schema

The GUI must reject or clearly warn about incompatible event protocol versions rather than attempting to parse unknown structures silently.

Database schema upgrades should use explicit migrations.

## 26. Out of scope for version 1

- Editing generated items in Library
- Direct AzerothCore database import
- Remote server management
- Network API
- Multi-user synchronization
- Cloud library
- Full Rust rewrite of the generator
- Reimplementing generator logic in TypeScript or Rust
- Plugin ecosystem
- Automatic client MPQ/patch creation beyond whatever artifacts the current generator already produces

These can be considered later without changing the fundamental process boundary.

## 27. Success criteria

The first release is successful when a Windows user can:

1. Install WotLK Item Forge without installing development tools.
2. Point the application at valid AzerothCore/data sources using native dialogs.
3. Configure all common generator options from Forge.
4. Start a generation run and see live structured progress.
5. Cancel safely.
6. Receive a clear validation result.
7. Open the generated output pack.
8. Search successful generated items in Library.
9. Inspect a generated item's detailed data.
10. Browse existing reports in-app while retaining access to raw files.
11. Revisit historical runs and preload their configurations.
12. Detect source drift for historical runs.
13. Obtain the same generator behavior through the desktop bridge as through the CLI for an equivalent configuration.

## 28. Implementation principle

The desktop app is a client of the generator, not a replacement for it.

Every implementation decision should preserve this boundary:

- Python owns generation correctness.
- Tauri/Rust owns process supervision and local desktop capabilities.
- React owns presentation and interaction.
- SQLite owns browsing/index/history data.
- Generated pack files remain portable artifacts independent of the desktop database.
