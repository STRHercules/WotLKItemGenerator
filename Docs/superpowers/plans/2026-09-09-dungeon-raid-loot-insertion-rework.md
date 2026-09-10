# Dungeon / Raid Loot Insertion Rework Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Rebuild default dungeon and raid loot placement from source-backed, difficulty-specific evidence so unsafe items remain world-only and encounter SQL fails closed.

**Architecture:** Keep the current `generate_pack.py` pipeline and dict-based records. Enrich the existing source catalog with stock loot evidence, build explicit profile/target evidence before assignment, then run deterministic placement and encounter validation before output. Keep gameobject support optional because the checked-in `Data/` snapshot has no gameobject SQL sources.

**Tech Stack:** Python standard library, `unittest`, existing SQL/DBC parsers, BLAKE2b via `hashlib`, CSV/JSON/SQL output already used by the repository.

**Spec:** `Docs/superpowers/specs/2026-09-09-dungeon-raid-loot-insertion-rework-design.md`

## Global Constraints

- Do not change item generation, item IDs, names, stats, effects, sockets, appearances, disenchanting, DBC generation, or seed behavior.
- Do not perform live database writes.
- Do not invent map, boss, gameobject, item, item-level, or loot-template IDs.
- Preserve additive stock loot behavior and generator-owned cleanup only.
- Use the current single-file pipeline and dict-based records; add no dependency or parallel encounter framework.
- Never use Python `hash()`, `random.random()`, or unordered iteration as a deterministic tie-breaker.
- A failed optional encounter integration must still emit valid item and world-loot output.
- Explicit manifest encounter order, targets, and ranges remain authoritative; source-backed manifest profiles receive the new source checks.
- Gameobject sources are optional; missing sources create explicit coverage exclusions, never guessed mappings.
- Preserve untracked `2229264932/` and `Old Versions/generate_pack v3.6.py`.

---

## File Map

- **Modify `generate_pack.py` source/catalog section:** parse optional source data, classify loot targets, resolve references, and retain evidence.
- **Modify `generate_pack.py` encounter section:** discover every map+difficulty, infer bands, assign items and sets, validate, and build reports.
- **Modify `generate_pack.py` output section:** render creature/reference/gameobject SQL, gate import order, and write diagnostics.
- **Modify `Tests/test_targeted_content.py`:** add isolated fixtures for every new safety rule and deterministic output contract.
- **Modify `Architecture.md`:** document source discovery, reports, optional gameobjects, and fail-closed import behavior.
- **Create no data files:** tests use temporary SQL/DBC-like fixtures and in-memory catalogs.

## Data Contracts

The implementation continues using dictionaries. These exact keys are the interfaces between tasks.

```python
target = {
    'type': 'creature' | 'gameobject' | 'reference',
    'entry': int,
    'creature_entry' or 'gameobject_entry': int,
    'source_kind': 'direct' | 'reference',
}

evidence = {
    'item_levels': tuple[int, ...],
    'required_levels': tuple[int, ...],
    'qualities': tuple[int, ...],
    'item_count': int,
    'direct_item_count': int,
    'reference_item_count': int,
    'rejected_reference_count': int,
    'band_source': str,
    'item_level_min': int,
    'item_level_max': int,
    'required_level_min': int,
    'required_level_max': int,
    'band_center': float,
    'rejections': list[dict],
}

profile = {
    'id': str,
    'map_id': int,
    'instance': str,
    'map_type': int,
    'difficulty_id': int,
    'difficulty_label': str,
    'loot_mode': int,
    'encounters': list[dict],
    'evidence': dict,
    'valid': bool,
    'invalid_reason': str,
}
```

The exact `evidence` shape may contain additional audit-only keys, but later tasks must use the names above rather than inventing parallel names.

### Task 1: Extend the source catalog and candidate coverage

**Files:**
- Modify: `generate_pack.py:2067-2086` (`load_encounter_source_catalog`)
- Modify: `generate_pack.py:1617-1653` (`parse_args`)
- Modify: `generate_pack.py:1676-1707` (`configure_runtime`)
- Test: `Tests/test_targeted_content.py` source fixtures

**Interfaces:**
- Consumes: existing map/DBC/creature/instance/loot source paths and optional gameobject paths.
- Produces: catalog keys `maps`, `map_difficulties`, `dungeon_maps`, `creature_templates`, `creature_maps`, `instance_encounters`, `creature_loot_rows`, `reference_loot_rows`, `creature_loot_entries`, `reference_loot_entries`, `gameobject_templates`, `gameobject_maps`, `gameobject_loot_rows`, and `source_audit`.

- [ ] **Step 1: Write failing catalog tests.** Add tests proving a scripted creature boss with a valid template and map relationship is discoverable without a static spawn, a raid map is not excluded because `DungeonMap.dbc` lacks a row, all raid difficulty IDs survive, and a supplied gameobject source is loaded as a first-class target.

```python
def test_scripted_boss_uses_instance_encounter_without_static_spawn(self):
    catalog = fixture_catalog(
        map_id=631, difficulty_ids=(0, 1, 2, 3),
        boss_entry=9001, boss_spawn_maps=(),
        boss_last_encounter_dungeon=500,
        dungeon_map_rows={500: (500, 631)},
    )
    manifest = g.build_default_encounter_manifest(catalog, 2.0)
    self.assertEqual({p['difficulty_id'] for p in manifest['profiles']}, {0, 1, 2, 3})
    self.assertTrue(any(t.get('creature_entry') == 9001
                        for p in manifest['profiles']
                        for e in p['encounters']
                        for t in e['targets']))

def test_raid_profile_does_not_require_dungeon_map_membership(self):
    catalog = fixture_catalog(map_id=631, difficulty_ids=(0,), dungeon_map_rows={})
    manifest = g.build_default_encounter_manifest(catalog, 2.0)
    self.assertEqual(manifest['coverage'][0]['profile_created'], True)

def test_gameobject_target_is_loaded_when_sources_are_supplied(self):
    catalog = fixture_catalog(gameobject_entry=7001, gameobject_loot_entry=97001)
    self.assertIn(7001, catalog['gameobject_templates'])
    self.assertIn(97001, catalog['gameobject_loot_entries'])
```

- [ ] **Step 2: Run the new tests and confirm they fail for the missing catalog behavior.**

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests.test_scripted_boss_uses_instance_encounter_without_static_spawn -v`

Expected: FAIL because current discovery requires static spawn membership and does not expose gameobject source rows.

- [ ] **Step 3: Add optional CLI paths and catalog parsing.** Add `--gameobject-source`, `--gameobject-template-source`, and `--gameobject-loot-source` with `None` defaults. Require all three when any is explicitly supplied; silently keep them unavailable for the checked-in default data bundle. Parse the existing SQL table format through `_load_sql_table_rows`, preserving raw rows and column indexes so later tasks can apply LootMode without positional guesses.

- [ ] **Step 4: Add source-backed map/target resolution.** Build `dungeon_map_by_lfg_entry` from the existing `DungeonMap.dbc` rows. Treat `instance_encounters` as boss existence evidence. Resolve creature bosses through static spawn maps first and `lastEncounterDungeon` context second; resolve gameobject credits only when optional templates, map membership, and loot rows prove the relationship. Do not reject a candidate raid merely because it has no DungeonMap row.

- [ ] **Step 5: Add candidate coverage records.** For each map type 1 or 2 and every `MapDifficulty.dbc` row, create a coverage record with `map_id`, `map_name`, `instance_type`, `expansion`, map type, difficulty label, target counts, and an explicit exclusion reason. Preserve the DBC expansion field when present; otherwise record an explicit source-derived `unknown` value and never invent a content tier from a map name. Update `loot_mode_for_difficulty` to support every source difficulty representable by the 16-bit LootMode field while retaining `1 << difficulty_id`.

- [ ] **Step 6: Run the catalog/source test group and the existing suite.**

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests -v`

Expected: new source tests pass and existing source tests remain green.

- [ ] **Step 7: Commit the catalog boundary.**

```text
feat: expand encounter source catalog
```

### Task 2: Build stock loot evidence and safe progression bands

**Files:**
- Modify: `generate_pack.py:2219-2247` (`_stock_item_metadata` and related helpers)
- Modify: `generate_pack.py:2447-2641` (SQL loot/reference helpers)
- Modify: `generate_pack.py:2120-2171` (`build_default_encounter_manifest` support helpers)
- Test: `Tests/test_targeted_content.py` band/evidence tests

**Interfaces:**
- Consumes: Task 1 catalog rows and `item_template` metadata.
- Produces: `collect_target_stock_evidence(catalog, profile_context, target) -> dict`, `infer_safe_band(values, source_kind, encounter_kind) -> dict`, and profile/target evidence using the Data Contracts keys.

- [ ] **Step 1: Write failing evidence tests.** Add fixtures with equippable stock rows around ItemLevel 150-160 plus one ilvl 284 contaminant, a shared reference consumed by two unrelated maps, separate normal/heroic LootMode rows, and a RequiredLevel 4 item whose ItemLevel is high.

```python
def test_outlier_rejection_keeps_dominant_equipment_cluster(self):
    evidence = g.infer_safe_band((150, 152, 155, 158, 160, 284), 'profile_aggregate', 'boss')
    self.assertLessEqual(evidence['item_level_max'], 160)
    self.assertIn(284, evidence['rejected_item_levels'])

def test_shared_reference_is_rejected_from_progression_evidence(self):
    catalog = fixture_catalog(shared_reference_maps={100, 200})
    evidence = g.collect_target_stock_evidence(catalog, profile_context(100, 0), target(9100))
    self.assertEqual(evidence['reference_item_count'], 0)
    self.assertEqual(evidence['rejected_reference_count'], 1)

def test_loot_mode_keeps_normal_and_heroic_bands_independent(self):
    normal = g.collect_target_stock_evidence(catalog, profile_context(100, 0), target(9100))
    heroic = g.collect_target_stock_evidence(catalog, profile_context(100, 1), target(9100))
    self.assertNotEqual((normal['item_level_min'], normal['item_level_max']),
                        (heroic['item_level_min'], heroic['item_level_max']))

def test_required_level_is_part_of_band_eligibility(self):
    self.assertFalse(g.item_fits_encounter_profile(
        {'ItemLevel': 180, 'RequiredLevel': 4, 'Quality': 4},
        profile_with_required_levels(70, 80, 170, 190)))
```

- [ ] **Step 2: Run the evidence tests and confirm expected failures.**

Run: `rtk py -m unittest Tests.test_targeted_content.BandTests -v`

Expected: FAIL because current code has no stock-loot evidence collector, no shared-reference rejection, and no RequiredLevel predicate.

- [ ] **Step 3: Parse stock equipment once for encounter analysis.** Reuse `_stock_item_metadata` and the existing `item_template` field indexes. Keep only positive-ItemLevel weapons and equipment inventory types with quality at least Uncommon. Preserve the full metadata needed for RequiredLevel, Quality, class mask, and item classification.

- [ ] **Step 4: Add LootMode-aware direct and reference traversal.** Map loot-table column names from the parsed SQL schema. A row applies when its LootMode intersects the profile LootMode; resolve direct item rows before references; recurse through reference groups with a visited set; and retain the source row and parent target in each evidence record. Reject reference groups whose consumers resolve to more than one unrelated map, while still allowing them to remain normal stock loot.

- [ ] **Step 5: Add deterministic robust band inference.** Sort discrete ItemLevels, split large gaps, retain the dominant cluster for aggregate/fallback evidence, and preserve independently supported direct target clusters. Return retained/rejected levels, source counts, quality set, center, and method. Reject empty evidence and invalidate unjustifiably broad fallback bands using the 20/25/30 width thresholds from the spec.

- [ ] **Step 6: Add RequiredLevel inference and eligibility.** Derive RequiredLevel bounds from retained equipment first, then bounded creature min/max context when stock rows are sparse. Never fall back to `1..80`. Add `item_fits_encounter_profile(item, profile_or_target)` requiring both ItemLevel and RequiredLevel containment plus quality support.

- [ ] **Step 7: Run the band tests and current suite.**

Run: `rtk py -m unittest Tests.test_targeted_content.BandTests Tests.test_targeted_content.LootTests -v`

Expected: new evidence tests pass; existing manifest loot tests remain green.

- [ ] **Step 8: Commit evidence and band inference.**

```text
feat: infer safe encounter loot bands
```

### Task 3: Rebuild default profiles and difficulty audits

**Files:**
- Modify: `generate_pack.py:2120-2171` (`build_default_encounter_manifest`)
- Modify: `generate_pack.py:2198-2217` (`validate_targeted_source_membership`)
- Modify: `Tests/test_targeted_content.py` profile/difficulty tests

**Interfaces:**
- Consumes: Task 1 catalog, Task 2 evidence helpers, explicit manifest compatibility rules.
- Produces: source-backed `manifest['profiles']`, `manifest['coverage']`, `manifest['difficulty_comparisons']`, and profile encounter records with `required_level`, `evidence`, and `valid` fields.

- [ ] **Step 1: Write failing profile tests.** Add tests that require separate normal/heroic bands, all raid difficulty IDs, scripted bosses without static spawns, coverage exclusions for missing stock equipment, and no use of raw creature-level `1..284` envelopes.

```python
def test_default_profiles_use_stock_bands_per_difficulty(self):
    manifest = g.build_default_encounter_manifest(difficulty_fixture(), 2.0)
    profiles = {p['difficulty_id']: p for p in manifest['profiles']}
    self.assertNotEqual(profiles[0]['item_level_max'], profiles[1]['item_level_max'])
    self.assertEqual(profiles[0]['loot_mode'], 1)
    self.assertEqual(profiles[1]['loot_mode'], 2)

def test_coverage_keeps_excluded_candidate_visible(self):
    manifest = g.build_default_encounter_manifest(no_stock_fixture(), 2.0)
    row = next(row for row in manifest['coverage'] if row['map_id'] == 631)
    self.assertFalse(row['profile_created'])
    self.assertEqual(row['excluded_reason'], 'no usable stock equipment loot')

def test_raid_difficulty_ids_are_not_discarded(self):
    manifest = g.build_default_encounter_manifest(raid_fixture((0, 1, 2, 3)), 2.0)
    self.assertEqual({p['difficulty_id'] for p in manifest['profiles']}, {0, 1, 2, 3})
```

- [ ] **Step 2: Run the profile tests and confirm they fail against the current creature-level implementation.**

Run: `rtk py -m unittest Tests.test_targeted_content.ProfileTests -v`

Expected: FAIL because the current default manifest copies creature-derived bands and only emits profiles when creature-spawn/loot checks pass.

- [ ] **Step 3: Replace default profile construction with candidate-first discovery.** Enumerate every candidate map+difficulty, collect boss targets from authoritative encounter rows, collect static trash targets, add verifiable gameobject targets, and attach per-target stock evidence. Keep candidates with invalid evidence in coverage but omit them from eligible profiles.

- [ ] **Step 4: Assign profile and encounter bands.** Use direct target evidence, then target-specific references, then valid map+difficulty aggregate evidence, then a bounded nearby encounter fallback. Store RequiredLevel and ItemLevel bands on profiles and encounter records; use encounter rank only after source evidence is exhausted.

- [ ] **Step 5: Add difficulty comparison records.** Compare every pair of profiles sharing a map. Record source counts, bands, identical status, LootMode, and reason. Identical bands are allowed only when the filtered evidence is genuinely identical; shared unfiltered data records a validation error.

- [ ] **Step 6: Preserve explicit manifest behavior.** Keep `validate_targeted_source_membership` for manifest targets, extend it for gameobjects and optional source fields, and invoke inferred evidence only for source-backed default profiles or source-backed manifest profiles.

- [ ] **Step 7: Run profile/source tests and the complete current suite.**

Run: `rtk py -m unittest discover -s Tests -v`

Expected: all existing tests plus new profile tests pass.

- [ ] **Step 8: Commit profile discovery and audits.**

```text
feat: build source-backed encounter profiles
```

### Task 4: Add deterministic placement and atomic set assignment

**Files:**
- Modify: `generate_pack.py:2176-2196` (`assign_default_encounter_items`)
- Modify: `generate_pack.py:2933-2967` (`assign_plan_encounters`)
- Modify: `generate_pack.py:3816-3910` set placement integration
- Test: `Tests/test_targeted_content.py` placement/set tests

**Interfaces:**
- Consumes: Task 3 valid profiles and Task 2 `item_fits_encounter_profile`.
- Produces: item metadata `content_profile`, `content_target`, `target_kind`, `placement_score`, `placement_reason`, `placement_band_source`, and set metadata; no metadata for world-only items.

- [ ] **Step 1: Write failing placement tests.** Cover no forced placement, RequiredLevel rejection, Legendary/trash rejection, Epic/trash evidence, deterministic profile tie-breaking, five-piece set atomicity, and an insufficient common profile leaving every set member world-only.

```python
def test_unmatched_item_remains_world_only(self):
    items = [{'entry': 1, 'ItemLevel': 284, 'RequiredLevel': 80, 'Quality': 4}]
    g.assign_default_encounter_items(items, safe_low_level_manifest())
    self.assertNotIn('content_profile', items[0])

def test_set_members_share_one_profile(self):
    items = set_items(5, item_level=220, required_level=80)
    g.assign_default_encounter_items(items, multi_profile_manifest())
    self.assertEqual({item['content_profile'] for item in items}, {'raid_10'})

def test_set_members_stay_world_only_without_common_profile(self):
    items = set_items(5, item_level=220, required_level=80)
    g.assign_default_encounter_items(items, split_only_manifest())
    self.assertTrue(all('content_profile' not in item for item in items))

def test_legendary_never_uses_trash(self):
    item = {'entry': 1, 'ItemLevel': 284, 'RequiredLevel': 80, 'Quality': 5}
    g.assign_default_encounter_items([item], legendary_trash_only_manifest())
    self.assertNotIn('content_target', item)
```

- [ ] **Step 2: Run placement tests and confirm they fail before the new eligibility/ranking logic.**

Run: `rtk py -m unittest Tests.test_targeted_content.PlacementTests -v`

Expected: FAIL because current assignment uses ItemLevel only, chooses a weighted eligible profile, and assigns set pieces independently.

- [ ] **Step 3: Add deterministic eligibility and ranking helpers.** Implement `encounter_item_eligibility(item, profile, encounter)`, `encounter_placement_score(item, profile, encounter)`, and `choose_encounter_profile(item, profiles)`. Use containment, center distance, RequiredLevel distance, source confidence, source-derived tier, encounter kind/rank, then `h64(SEED, entry, profile_id, difficulty_id, encounter_id, 'placement')`.

- [ ] **Step 4: Assign generated sets as units.** Group by existing `itemset`/set ID before normal items. Compute the intersection of eligible profiles for all members; choose one profile; assign slots to sorted boss targets using the specified early/middle/late order. If the intersection is empty, remove placement metadata from every member.

- [ ] **Step 5: Assign ordinary items conservatively.** Use the chosen valid profile and only its eligible targets. Reject Legendary trash and unsupported high-quality trash. Leave items with no valid target world-only. Never use loop order as a tie-break.

- [ ] **Step 6: Preserve explicit manifest set groups.** Update `assign_plan_encounters` so a `set_request_index` group is one assignment unit, while explicit per-item targets still fail if they split a set across profiles.

- [ ] **Step 7: Run placement tests, existing targeted tests, and determinism checks.**

Run: `rtk py -m unittest Tests.test_targeted_content.PlacementTests Tests.test_targeted_content.LootTests -v`

Expected: all placement and existing manifest tests pass; repeated assignment with the same `SEED` yields identical metadata.

- [ ] **Step 8: Commit deterministic placement.**

```text
feat: assign encounter loot conservatively
```

### Task 5: Validate encounter integration and fail closed

**Files:**
- Modify: `generate_pack.py` near encounter helpers after `build_manifest_encounter_loot_records`
- Modify: `generate_pack.py:4479-4880` (`write_outputs` and report construction)
- Test: `Tests/test_targeted_content.py` validation/safety tests

**Interfaces:**
- Consumes: Tasks 1-4 profiles, placements, evidence, and records.
- Produces: `validate_encounter_integration(items, manifest, records, catalog) -> dict` with `valid`, `errors`, `warnings`, `coverage`, `profiles`, `difficulty_comparisons`, `placement_summary`, and `set_summary`.

- [ ] **Step 1: Write failing validation/safety tests.** Add tests for invalid bands, duplicate pools, out-of-band RequiredLevel, split sets, high-end dungeon collapse, and invalid encounter output continuing with world/item output while omitting encounter paths from `IMPORT_ORDER.txt`.

```python
def test_invalid_encounter_integration_is_reported_without_sql_import(self):
    report, import_order = run_output_with_invalid_encounter_profile()
    self.assertFalse(report['encounter_integration_valid'])
    self.assertTrue(report['encounter_validation_errors'])
    self.assertNotIn('dungeon_raid_encounter_loot.sql', import_order)
    self.assertTrue((output_dir() / 'sql' / '80_pool.sql').exists())
```

- [ ] **Step 2: Run the safety tests and confirm failure.**

Run: `rtk py -m unittest Tests.test_targeted_content.SafetyTests -v`

Expected: FAIL because current encounter exceptions abort `write_outputs` and no encounter validation status exists.

- [ ] **Step 3: Implement profile, difficulty, placement, set, and endgame validation.** Return structured errors and warnings instead of raising for optional encounter safety failures. Validate every profile ID, pool ID, map/difficulty, target type, LootMode, band, source count, item reference, RequiredLevel, quality rule, set group, and high-end distribution. Only run the generic raid-collapse error when valid raid evidence and eligible generated high-end items both exist.

- [ ] **Step 4: Add fail-closed output staging.** In `write_outputs`, build world/item data independently, wrap encounter assignment/record/validation in an encounter status boundary, clear invalid encounter metadata, and continue output. Append encounter cleanup/SQL files to `IMPORT_ORDER.txt` only when the status is valid and records are non-empty.

- [ ] **Step 5: Write `validation_report.json` status fields.** Add `encounter_integration_enabled`, `encounter_integration_valid`, `encounter_validation_errors`, and `encounter_validation_warnings` without changing existing core report keys.

- [ ] **Step 6: Run safety tests and the full suite.**

Run: `rtk py -m unittest Tests.test_targeted_content.SafetyTests Tests.test_targeted_content.RuntimeTests -v`

Expected: safety gating passes and no existing test regresses.

- [ ] **Step 7: Commit encounter validation and gating.**

```text
feat: fail closed on unsafe encounter loot
```

### Task 6: Render gameobject SQL and complete audit reports

**Files:**
- Modify: `generate_pack.py:4344-4414` placement/report/render helpers
- Modify: `generate_pack.py:4479-4880` output files, collision SQL, cleanup SQL, README template
- Test: `Tests/test_targeted_content.py` SQL/report tests

**Interfaces:**
- Consumes: Task 5 valid encounter records and report dictionaries.
- Produces: correct table-specific SQL, cleanup, collision checks, `encounter_profile_coverage.csv`, `encounter_profiles.csv`, `difficulty_band_comparison.csv`, `encounter_band_rejections.csv`, `set_manifest.csv`, and expanded placement CSVs.

- [ ] **Step 1: Write failing SQL/report tests.** Add a gameobject target fixture and assert generated SQL uses `gameobject_loot_template`, cleanup removes only its generated attachment, and all new CSV headers contain the required evidence columns.

```python
def test_gameobject_encounter_sql_uses_gameobject_table(self):
    sql, cleanup = g.render_encounter_loot_sql(gameobject_records())
    self.assertIn('INSERT INTO `gameobject_loot_template`', sql)
    self.assertIn('DELETE FROM `gameobject_loot_template`', cleanup)

def test_encounter_reports_include_evidence_columns(self):
    paths = g.write_placement_reports(items, loot, records, directory, manifest, catalog)
    header = pathlib.Path(paths['encounter']).read_text(encoding='utf-8').splitlines()[0]
    self.assertIn('profile_required_level_min', header)
    self.assertIn('band_source', header)
    self.assertIn('placement_score', header)
    self.assertIn('set_atomic_profile', header)
```

- [ ] **Step 2: Run the report tests and confirm they fail.**

Run: `rtk py -m unittest Tests.test_targeted_content.ReportTests -v`

Expected: FAIL because non-creature targets currently fall through to `reference_loot_template` and placement reports lack evidence fields.

- [ ] **Step 3: Map target type to SQL table.** Update `render_encounter_loot_sql` and all cleanup/collision builders so `creature`, `reference`, and `gameobject` each use their own table. Preserve additive deletes keyed by generated pool/attachment identity only.

- [ ] **Step 4: Emit coverage, profile, comparison, rejection, and set CSVs.** Use stable field order and sorted rows. Emit headers even when encounter integration is invalid. Add the specified per-item evidence fields to `dungeon_raid_item_placements.csv` and retain world placement output for every generated item.

- [ ] **Step 5: Update collision and rollback SQL.** Include gameobject attachment predicates and all encounter pool/reference IDs in `00_PREIMPORT_COLLISION_CHECK.sql`, `00_generated_encounter_loot_cleanup.sql`, and `99_REMOVE_GENERATED_ITEMS.sql` without broad table deletes.

- [ ] **Step 6: Run SQL/report tests and the full suite.**

Run: `rtk py -m unittest Tests.test_targeted_content.ReportTests Tests.test_targeted_content.LootTests -v`

Expected: table-specific SQL, cleanup, headers, and existing reports pass.

- [ ] **Step 7: Commit SQL and audit output.**

```text
feat: add encounter evidence reports
```

### Task 7: Update documentation and validate the full acceptance path

**Files:**
- Modify: `Architecture.md:2094-2117, 2639-2652, 2819-2898, 3149+`
- Modify: `generate_pack.py` generated README template near `write_outputs`
- Test: `Tests/test_targeted_content.py` and command-level smoke checks

**Interfaces:**
- Consumes: final implementation and report names from Tasks 1-6.
- Produces: documentation matching default behavior, optional source behavior, fail-closed imports, and verification evidence for seed `2229264932`.

- [ ] **Step 1: Write a documentation contract test or grep checklist.** Verify the docs mention stock-loot bands, RequiredLevel, all difficulty IDs, coverage/rejection/comparison reports, atomic sets, optional gameobjects, world-only fallback, and encounter SQL safety gating.

- [ ] **Step 2: Run the documentation check before editing.**

Run: `rtk rg -n -i "RequiredLevel|coverage|band rejection|difficulty_band_comparison|gameobject|world-only|fail closed|IMPORT_ORDER" Architecture.md generate_pack.py`

Expected: the new terms are absent or describe the old creature-level-only contract, proving the documentation change is needed.

- [ ] **Step 3: Update the architecture and generated README contracts.** Replace the old statement that profiles use spawned creature min/max levels with the source-evidence contract. Document all new files, invalid-output behavior, optional gameobject inputs, and the distinction between core and encounter validation.

- [ ] **Step 4: Run the complete unit suite and diff checks.**

Run: `rtk py -m unittest discover -s Tests -v`

Expected: all tests pass with zero failures.

Run: `rtk git diff --check`

Expected: no whitespace errors.

- [ ] **Step 5: Run a deterministic small smoke twice.**

Run: `rtk py .\generate_pack.py --number 100 --seed 2229264932 --ui plain`

Repeat the same command after moving the first output directory aside. Compare `dungeon_raid_item_placements.csv`, `encounter_loot.csv`, and encounter SQL byte-for-byte.

Expected: identical files; invalid encounter integration, if triggered by the small sample, is reported without removing item/world output.

- [ ] **Step 6: Run the requested 100,000-item acceptance generation.**

Run: `rtk py .\generate_pack.py --seed 2229264932 --ui plain`

Inspect `validation_report.json`, `encounter_profile_coverage.csv`, `encounter_profiles.csv`, `difficulty_band_comparison.csv`, `dungeon_raid_item_placements.csv`, `set_manifest.csv`, and `sql/IMPORT_ORDER.txt`.

Expected: no contaminated low-level bands, RequiredLevel-compatible placements, independent difficulty bands, WotLK raid coverage or explicit reasons, atomic sets, no Legendary trash, and encounter SQL present only when encounter validation is valid.

- [ ] **Step 7: Commit documentation and acceptance evidence.**

```text
docs: document safe encounter loot outputs
```

## Final verification checklist

- [ ] `rtk py -m unittest discover -s Tests -v` passes.
- [ ] `rtk git diff --check` passes.
- [ ] Same seed/source inputs produce byte-identical encounter reports and SQL.
- [ ] Core item/world-loot output survives deliberately invalid encounter validation.
- [ ] `IMPORT_ORDER.txt` omits encounter SQL when encounter validation is invalid.
- [ ] Coverage includes valid/excluded candidate map+difficulties and raid exclusions are explicit.
- [ ] RequiredLevel and ItemLevel are both enforced.
- [ ] Direct/reference evidence and LootMode are recorded per profile/difficulty.
- [ ] Generated sets are all-world-only or contained within one map+difficulty.
- [ ] Gameobject SQL uses `gameobject_loot_template` when optional sources are supplied.
- [ ] No unrelated dirty or untracked user files were staged.
