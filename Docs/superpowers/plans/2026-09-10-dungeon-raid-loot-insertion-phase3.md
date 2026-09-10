# Dungeon / Raid Loot Insertion Rework — Phase 3 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Make source-backed encounter placement distribute safe loot across equivalent profiles, resolve sibling progression eras, accept only verified shared references, and support optional static/scripted gameobject rewards.

**Architecture:** Keep the current `generate_pack.py` dict-based pipeline. Extend its existing SQL/DBC catalog and evidence traversal, apply sibling coherence after independent profile inference, then separate hard eligibility from deterministic rendezvous distribution before the current encounter SQL safety gate. Reports and cleanup remain generator-owned and additive.

**Tech Stack:** Python standard library, `unittest`, existing SQL table parser, WotLK DBC readers, `hashlib.blake2b`, CSV/JSON/SQL writers.

**Spec:** `Docs/superpowers/specs/2026-09-10-dungeon-raid-loot-insertion-phase3-design.md`

## Global Constraints

- Do not rewrite item generation, progression curves, IDs, names, stats, effects, sockets, appearances, disenchanting, or DBC generation.
- No new dependency, package, encounter framework, database client, or live database write.
- No invented map, encounter, gameobject, item, loot, or progression IDs.
- Preserve the current safe RequiredLevel, ItemLevel, quality, boss/trash, set atomicity, Legendary, mixed-era, and fail-closed rules.
- A shared reference is eligible only through a verified difficulty-specific parent and still passes normal equipment, progression, quality, and outlier filtering.
- Only WotLK chest-like gameobjects (`type = 3`) with positive `Data1` are eligible for reward-object analysis.
- A chest existing on a map never proves a boss relationship. Same-file script symbol co-occurrence never proves a scripted reward.
- Use `Data1` for `gameobject_template` loot IDs; never use the gameobject template entry as its loot ID.
- Use `h64`/BLAKE2b for deterministic distribution. Never use Python `hash()`, mutable counters, random iteration order, or map names as special cases.
- Missing optional gameobject or AzerothCore script sources produce explicit `not_exercised`/excluded diagnostics and do not disable core item/world-loot output.
- Encounter SQL is emitted and added to `sql/IMPORT_ORDER.txt` only when encounter validation is valid. Invalid optional encounter integration still emits item/world output and diagnostics.
- Preserve user-owned untracked generated outputs and ignored `Data/*.sql` files; never stage or rewrite them as part of this work.

## File Map

- Modify `generate_pack.py` source defaults, CLI/runtime wiring, catalog loading, evidence traversal, profile inference, placement, validation, report writers, SQL safety files, and generated README text.
- Modify `Tests/test_targeted_content.py` with focused fixture-backed regression tests.
- Modify `Architecture.md` with the Phase 3 source, evidence, placement, report, and import contracts.
- Create no source-data files, generated packs, temporary fixture files, or new Python modules.
- Add `Docs/superpowers/specs/2026-09-10-dungeon-raid-loot-insertion-phase3-design.md` only as the already-reviewed design input; do not alter it during execution.

## Shared Data Contracts

Use these exact dictionary keys across tasks. Existing keys not listed here remain unchanged.

```python
gameobject_template = {
    'entry': int,
    'type': int,
    'name': str,
    'lootid': int,             # gameobject_template.Data1
}

gameobject_spawn = {
    'guid': int,
    'entry': int,
    'map_id': int,
    'spawn_mask': int,
}

script_reward = {
    'source_script': str,
    'encounter_entry': int | None,
    'encounter_name': str,
    'gameobject_entry': int,
    'difficulty_condition': str,
    'evidence_type': str,
}

reference_provenance = {
    'reference_id': int,
    'parent_target_type': 'creature' | 'gameobject' | 'reference',
    'parent_target_entry': int,
    'effective_target_entry': int,
    'parent_loot_id': int,
    'map_id': int,
    'difficulty_id': int,
    'parent_loot_mode': int,
    'reference_loot_mode': int,
    'consumer_map_count': int,
    'consumer_profile_count': int,
    'verified_parent': bool,
}

placement_metadata = {
    'encounter_equivalence_group': str,
    'encounter_eligible_profile_count': int,
    'encounter_distribution_weight': float,
    'encounter_distribution_score': float,
}
```

Every new helper below is a plain function in `generate_pack.py`; no class or new module is needed.

## Test Fixture Additions

Add these small helpers beside the existing test fixtures in `Tests/test_targeted_content.py`. They use the repository's existing `_minimal_encounter_catalog`, `_phase2_difficulty_catalog`, `_placement_profile`, and `_placement_manifest` helpers rather than introducing a fixture framework.

```python
def _catalog_with_gameobject_sources():
    catalog = _minimal_encounter_catalog(map_id=631, map_type=2,
                                         difficulty_ids=(0,))
    loot_columns = catalog['creature_loot_columns']
    catalog['gameobject_templates'] = {
        7001: {'entry': 7001, 'type': 3, 'name': 'Reward Chest',
               'lootid': 97001},
        7002: {'entry': 7002, 'type': 5, 'name': 'Invalid Door',
               'lootid': 97002},
    }
    catalog['gameobject_spawns'] = [
        {'guid': 1, 'entry': 7001, 'map_id': 631, 'spawn_mask': 3},
        {'guid': 2, 'entry': 7002, 'map_id': 631, 'spawn_mask': 3},
    ]
    catalog['gameobject_maps'] = {7001: {631}, 7002: {631}}
    catalog['gameobject_loot_columns'] = loot_columns
    catalog['gameobject_loot_rows'] = [
        (97001, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'reward'),
        (97002, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'invalid'),
    ]
    catalog['gameobject_loot_entries'] = {97001, 97002}
    return catalog


def _onyxia_style_catalog():
    catalog = _minimal_encounter_catalog(
        map_id=249, map_type=2, instance_type=29, difficulty_ids=(0, 1))
    catalog['creature_templates'][9001]['difficulty_entries'] = (9101,)
    catalog['creature_templates'][9001].update({'minlevel': 60, 'maxlevel': 60})
    catalog['creature_templates'][9101] = {
        'entry': 9101, 'name': 'Modern Boss', 'lootid': 9101,
        'minlevel': 83, 'maxlevel': 83, 'difficulty_entries': (),
    }
    catalog['creature_loot_rows'] = [
        (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'legacy'),
        (9100, 5002, 0, 100.0, 0, 1, 0, 1, 1, 'legacy'),
        (9100, 5003, 0, 100.0, 0, 1, 0, 1, 1, 'legacy'),
        (9101, 5004, 0, 100.0, 0, 2, 0, 1, 1, 'modern'),
        (9101, 5005, 0, 100.0, 0, 2, 0, 1, 1, 'modern'),
        (9101, 5006, 0, 100.0, 0, 2, 0, 1, 1, 'modern'),
    ]
    catalog['creature_loot_entries'] = {9100, 9101}
    catalog['stock_items'] = {
        5001: _stock_item(5001, 63, 60),
        5002: _stock_item(5002, 70, 60),
        5003: _stock_item(5003, 76, 60),
        5004: _stock_item(5004, 232, 80),
        5005: _stock_item(5005, 245, 80),
        5006: _stock_item(5006, 245, 80),
    }
    return catalog


def _low_level_with_one_outlier_catalog():
    catalog = _minimal_encounter_catalog(
        map_id=100, map_type=1, instance_type=1, difficulty_ids=(0,))
    catalog['creature_loot_rows'] = [
        (9100, 5001, 0, 100.0, 0, 1, 0, 1, 1, 'low'),
        (9100, 5002, 0, 100.0, 0, 1, 0, 1, 1, 'low'),
        (9100, 5003, 0, 100.0, 0, 1, 0, 1, 1, 'low'),
        (9100, 5004, 0, 100.0, 0, 1, 0, 1, 1, 'unrelated outlier'),
    ]
    catalog['stock_items'] = {
        5001: _stock_item(5001, 110, 70),
        5002: _stock_item(5002, 115, 70),
        5003: _stock_item(5003, 120, 70),
        5004: _stock_item(5004, 284, 80),
    }
    return catalog
```

The output integration test helper must call the public pipeline with a temporary `OUT`/`SQLDIR` override, then return `pathlib.Path(g.OUT)`. It must restore the previous global `OUT` and `SQLDIR` in a `finally` block so the existing generated output directory is never touched.

### Task 1: Auto-discover and retain optional gameobject sources

**Files:**
- Modify: `generate_pack.py:52-75` source constants, `parse_args`, `configure_runtime`, and `load_encounter_source_catalog`
- Test: `Tests/test_targeted_content.py:SourceTests`

**Interfaces:**
- Add `DEFAULT_GAMEOBJECT_SOURCE`, `DEFAULT_GAMEOBJECT_TEMPLATE_SOURCE`, and `DEFAULT_GAMEOBJECT_LOOT_SOURCE` using `_default_data_source`.
- Add `resolve_optional_gameobject_sources(explicit_paths=None)` returning either a three-path tuple or `None`.
- Extend the catalog with `gameobject_templates`, `gameobject_spawns`, `gameobject_maps`, `gameobject_loot_rows`, `gameobject_loot_entries`, and source-audit status.
- Add `--azerothcore-source-root`; retain the existing three `--gameobject-*` options as explicit overrides.

- [ ] **Step 1: Add failing source-discovery tests.**

```python
def test_complete_default_gameobject_trio_is_discoverable(self):
    with tempfile.TemporaryDirectory() as directory:
        root = pathlib.Path(directory)
        for name in ('gameobject.sql', 'gameobject_template.sql',
                     'gameobject_loot_template.sql'):
            (root / name).write_text('source', encoding='utf-8')

        paths = g.resolve_optional_gameobject_sources(
            data_dir=root, explicit_paths=(None, None, None))

    self.assertEqual(paths, tuple(root / name for name in (
        'gameobject.sql', 'gameobject_template.sql',
        'gameobject_loot_template.sql')))

def test_incomplete_explicit_gameobject_trio_is_rejected(self):
    with self.assertRaises(ValueError):
        g.resolve_optional_gameobject_sources(
            explicit_paths=(pathlib.Path('gameobject.sql'), None, None))

def test_gameobject_catalog_uses_data1_and_retains_spawn_fields(self):
    catalog = _catalog_with_gameobject_sources()

    self.assertEqual(catalog['gameobject_templates'][7001]['lootid'], 97001)
    self.assertEqual(catalog['gameobject_templates'][7001]['type'], 3)
    self.assertEqual(catalog['gameobject_spawns'][0]['spawn_mask'], 3)
    self.assertEqual(catalog['gameobject_maps'][7001], {631})
```

- [ ] **Step 2: Run the new source tests and verify the expected RED failure.**

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests.test_complete_default_gameobject_trio_is_discoverable Tests.test_targeted_content.SourceTests.test_incomplete_explicit_gameobject_trio_is_rejected Tests.test_targeted_content.SourceTests.test_gameobject_catalog_uses_data1_and_retains_spawn_fields -v`

Expected: FAIL because the resolver does not exist and the catalog currently does not retain spawn/template name fields.

- [ ] **Step 3: Implement optional source resolution.**

```python
def resolve_optional_gameobject_sources(explicit_paths=None, data_dir=DATA_DIR):
    explicit=tuple(explicit_paths or (None, None, None))
    if any(path is not None for path in explicit):
        if not all(path is not None for path in explicit):
            raise ValueError('gameobject sources must be supplied together')
        return tuple(Path(path).expanduser().resolve() for path in explicit)
    defaults=tuple(Path(data_dir) / name for name in (
        'gameobject.sql', 'gameobject_template.sql',
        'gameobject_loot_template.sql'))
    return defaults if all(path.is_file() for path in defaults) else None
```

Use the helper from `configure_runtime`. Explicit paths still win; an incomplete default trio becomes `None` rather than an error.

- [ ] **Step 4: Add the script-root CLI option and runtime field.**

Add `--azerothcore-source-root` as a `Path` defaulting to `None`. Store its resolved value in the runtime dictionary and pass it into catalog construction without requiring it for normal generation.

- [ ] **Step 5: Retain gameobject spawn/template fields in the catalog.**

Read `gameobject_template.name`, `type`, and case-insensitive `Data1`. Read every gameobject row's `guid`, `id`, `map`, and `spawnMask`; index map membership by template entry while retaining one spawn record per row. Load the existing SQL table parser only; do not add a second parser.

- [ ] **Step 6: Record optional source status and run the source tests GREEN.**

Set `source_audit['gameobject_support']` to `exercised` only when the complete trio is loaded. Set `source_audit['script_reward_mapping']` to `not_exercised` until Task 2 finds explicit script evidence.

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests -v`

Expected: all source tests pass, including the pre-existing tests for scripted creature bosses, raid map discovery, and gameobject SQL loading.

- [ ] **Step 7: Commit the source contract.**

```text
feat(encounters): discover gameobject sources
```

### Task 2: Discover and audit static/scripted reward gameobjects

**Files:**
- Modify: `generate_pack.py` around `build_default_encounter_manifest`, source validation, and report helpers
- Test: `Tests/test_targeted_content.py:SourceTests, ReportTests`

**Interfaces:**
- Add `discover_gameobject_reward_targets(catalog, map_id=None, difficulty_id=None)` returning audit rows with the fields required by `gameobject_reward_targets.csv`.
- Add `discover_script_reward_mappings(source_root, catalog)` returning `list[script_reward]` and the status `exercised`/`not_exercised`.
- Preserve valid encounter target records with `association_method` values `static_spawn`, `script_summon`, or `explicit_instance_mapping`.

- [ ] **Step 1: Add failing static association tests.**

```python
def test_static_chest_uses_map_and_data1_without_fuzzy_boss_association(self):
    catalog = _catalog_with_gameobject_sources()
    catalog['instance_encounters'] = {}

    rows = g.discover_gameobject_reward_targets(catalog, 631, 0)

    self.assertEqual(rows[0]['gameobject_entry'], 7001)
    self.assertEqual(rows[0]['loot_entry'], 97001)
    self.assertEqual(rows[0]['spawn_mask'], 3)
    self.assertFalse(rows[0]['valid'])
    self.assertIn('boss', rows[0]['invalid_reason'].lower())

def test_gameobject_instance_mapping_is_valid_only_for_the_matching_map(self):
    catalog = _catalog_with_gameobject_sources()
    catalog['instance_encounters'] = {
        44: {'credit_type': 1, 'credit_entry': 7001,
             'last_encounter_dungeon': 500, 'comment': 'Reward Cache'},
    }
    catalog['dungeon_maps'] = {500: (500, 631)}

    rows = g.discover_gameobject_reward_targets(catalog, 631, 0)

    self.assertTrue(rows[0]['valid'])
    self.assertEqual(rows[0]['association_method'], 'explicit_instance_mapping')
```

- [ ] **Step 2: Run the static tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests.test_static_chest_uses_map_and_data1_without_fuzzy_boss_association Tests.test_targeted_content.SourceTests.test_gameobject_instance_mapping_is_valid_only_for_the_matching_map -v`

Expected: FAIL because static gameobject audit rows are not produced.

- [ ] **Step 3: Add the explicit static target collector.**

Iterate `gameobject_spawns`, resolve the template, require `type == 3` and positive `lootid`, require the loot entry in `gameobject_loot_entries`, and retain `guid`, map, spawn mask, template name, and loot entry. Match `creditType == 1` instance-encounter rows by gameobject entry and `lastEncounterDungeon` map resolution. A map-only chest gets an invalid audit row and never enters a boss encounter.

- [ ] **Step 4: Add failing script evidence tests.**

```python
def test_explicit_done_path_summon_maps_script_reward(self):
    source = """
enum GameObjects { GO_REWARD_CHEST = 7001 };
void InstanceTest::SetBossState(uint32 id, EncounterState state) {
    if (id == DATA_BOSS && state == DONE)
        instance->SummonGameObject(GO_REWARD_CHEST, 1, 2, 3, 4, 5, 6, 7);
}
"""
    with tempfile.TemporaryDirectory() as directory:
        root = pathlib.Path(directory)
        (root / 'instance_test.cpp').write_text(source, encoding='utf-8')
        mappings, status = g.discover_script_reward_mappings(root, {
            'gameobject_templates': {7001: {'entry': 7001, 'type': 3,
                                            'name': 'Reward Chest',
                                            'lootid': 97001}},
            'gameobject_loot_entries': {97001},
        })

    self.assertEqual(status, 'exercised')
    self.assertEqual(mappings[0]['gameobject_entry'], 7001)
    self.assertIn('SummonGameObject', mappings[0]['evidence_type'])

def test_same_file_symbol_cooccurrence_is_not_script_reward_evidence(self):
    source = "enum GameObjects { GO_REWARD_CHEST = 7001 }; void Other() { }"
    with tempfile.TemporaryDirectory() as directory:
        path = pathlib.Path(directory) / 'unrelated.cpp'
        path.write_text(source, encoding='utf-8')
        mappings, status = g.discover_script_reward_mappings(
            pathlib.Path(directory), {'gameobject_templates': {7001: {}},
                                       'gameobject_loot_entries': {97001}})

    self.assertEqual(status, 'exercised')
    self.assertEqual(mappings, [])
```

- [ ] **Step 5: Run the script tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests.test_explicit_done_path_summon_maps_script_reward Tests.test_targeted_content.SourceTests.test_same_file_symbol_cooccurrence_is_not_script_reward_evidence -v`

Expected: FAIL because no source-root scanner exists.

- [ ] **Step 6: Implement the conservative script scanner.**

Walk only files below `<root>/src/server/scripts/` when that directory exists, plus the root itself in the isolated fixture. Resolve numeric gameobject constants and `GO_*` enum/constant names. Accept a mapping only when the explicit call to `SummonGameObject` or an equivalent named reward action appears inside a function/method block that also contains an encounter-completion condition such as `SetBossState(..., DONE)` or `state == DONE`. Do not accept symbols that merely occur in the same file. Record source path, nearest encounter identifier/name, gameobject entry, visible difficulty condition, and evidence type.

- [ ] **Step 7: Feed valid static/script targets into default profiles.**

Use static `explicit_instance_mapping` and accepted `script_summon` mappings as boss/reward targets only after their loot entry and map/difficulty context validate. Preserve map-only invalid rows for the audit. Set `script_reward_mapping` to `exercised` only when the scanner ran with a supplied source root; an empty result is still exercised, while no root is not exercised.

- [ ] **Step 8: Add the reward-target CSV writer and run source/report tests GREEN.**

Write `gameobject_reward_targets.csv` with this fixed header:

```text
profile_id,map_id,difficulty_id,encounter_id,encounter_name,
gameobject_entry,gameobject_name,loot_entry,spawn_guid,spawn_mask,
association_method,association_source,direct_item_count,reference_item_count,
valid,invalid_reason
```

Run: `rtk py -m unittest Tests.test_targeted_content.SourceTests Tests.test_targeted_content.ReportTests -v`

Expected: static/script association, no-fuzzy-association, existing gameobject SQL, and report tests pass.

- [ ] **Step 9: Commit reward-object discovery.**

```text
feat(encounters): audit gameobject rewards
```

### Task 3: Make shared-reference evidence provenance-aware

**Files:**
- Modify: `generate_pack.py:_reference_consumer_maps`, `collect_target_stock_evidence`, source catalog audit, and report helpers
- Test: `Tests/test_targeted_content.py:BandTests, Phase2Tests, SourceTests, ReportTests`

**Interfaces:**
- Add `reference_provenance_rows(catalog)` returning sorted `reference_provenance` dictionaries.
- Extend evidence with `reference_provenance`, `reference_item_count`, `rejected_reference_count`, `rejections`, and quality counts without removing existing keys.
- Keep `collect_target_stock_evidence(catalog, profile_context, target)` as the caller-facing function.

- [ ] **Step 1: Add a failing verified-parent reference test.**

```python
def test_verified_difficulty_parent_can_use_shared_reference(self):
    catalog = _phase2_difficulty_catalog(difficulty_ids=(0, 1))
    catalog['creature_loot_rows'] = [
        (9102, 0, 9200, 100.0, 0, 2, 0, 1, 1, 'heroic reference'),
    ]
    catalog['reference_loot_rows'] = [
        (9200, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'heroic gear'),
    ]
    catalog['reference_loot_entries'] = {9200}
    catalog['stock_items'][5002] = _stock_item(5002, 200, 80)

    evidence = g.collect_target_stock_evidence(
        catalog,
        {'map_id': 100, 'difficulty_id': 1, 'loot_mode': 2,
         'difficulty_template_source': True},
        {'type': 'creature', 'entry': 9102,
         'creature_entry': 9002, 'effective_creature_entry': 9102},
    )

    self.assertEqual(evidence['reference_item_count'], 1)
    self.assertEqual(evidence['reference_provenance'][0]['reference_id'], 9200)
    self.assertTrue(evidence['reference_provenance'][0]['verified_parent'])

def test_verified_heroic_culling_reference_is_contextual_not_hardcoded(self):
    catalog = _phase2_difficulty_catalog(map_id=595, difficulty_ids=(1,))
    catalog['creature_loot_rows'] = [
        (9102, 0, 9200, 100.0, 0, 2, 0, 1, 1, 'heroic Culling path'),
    ]
    catalog['reference_loot_rows'] = [
        (9200, 5002, 0, 100.0, 0, 2, 0, 1, 1, 'level 80 gear'),
    ]
    catalog['reference_loot_entries'] = {9200}
    catalog['stock_items'][5002] = _stock_item(5002, 200, 80)

    evidence = g.collect_target_stock_evidence(
        catalog,
        {'map_id': 595, 'difficulty_id': 1, 'loot_mode': 2,
         'difficulty_template_source': True},
        {'type': 'creature', 'entry': 9102,
         'creature_entry': 9002, 'effective_creature_entry': 9102},
    )

    self.assertEqual(evidence['reference_item_count'], 1)
    self.assertEqual(evidence['reference_provenance'][0]['map_id'], 595)
```

- [ ] **Step 2: Run the verified-parent and existing contamination tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.BandTests.test_shared_reference_is_rejected_from_progression_evidence Tests.test_targeted_content.Phase2Tests.test_difficulty_variant_reference_consumer_maps_to_base_spawn Tests.test_targeted_content.SourceTests.test_verified_difficulty_parent_can_use_shared_reference -v`

Expected: the existing rejection tests remain green and the new acceptance test fails because provenance is not retained and the shared-reference rule has no verified-parent branch.

- [ ] **Step 3: Index reference consumers with parent context.**

Change the internal consumer index from only `reference -> maps` to records containing parent loot table type, parent entry, effective target, map set, and whether the path comes from a difficulty-specific target. Keep a derived map set for existing callers, but never use it as the sole acceptance decision.

- [ ] **Step 4: Make recursive loot traversal record provenance.**

When a parent row references a group, capture the parent target type/entry, effective target, parent loot ID, profile map/difficulty, parent LootMode, reference LootMode, consumer count, and the verified-parent boolean before recursing. Apply `_loot_mode_applies` to both parent and reference rows. Use a visited set keyed by reference ID and context to avoid cycles without globally merging unrelated contexts.

- [ ] **Step 5: Implement the verified-parent rule.**

Accept a shared reference only when the target is source-valid, the exact effective target/loot path is proven for the profile map and difficulty, the parent is difficulty-specific or explicitly mapped to that profile, and LootMode applies. Reject globally shared references with no such parent context and preserve the existing rejection reason. Continue all normal stock-equipment and progression filtering after acceptance.

- [ ] **Step 6: Add the provenance report and run evidence tests GREEN.**

Write `encounter_reference_provenance.csv` with fixed columns:

```text
reference_id,parent_target_type,parent_target_entry,effective_target_entry,
parent_loot_id,map_id,difficulty_id,parent_loot_mode,reference_loot_mode,
consumer_map_count,consumer_profile_count,verified_parent
```

Run: `rtk py -m unittest Tests.test_targeted_content.BandTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SourceTests Tests.test_targeted_content.ReportTests -v`

Expected: unresolved shared references remain rejected, verified creature and gameobject parents are accepted, and provenance rows are deterministic.

- [ ] **Step 7: Commit reference provenance.**

```text
feat(encounters): prove shared loot context
```

### Task 4: Preserve progression clusters and apply sibling coherence

**Files:**
- Modify: `generate_pack.py:infer_safe_band`, `_merge_stock_evidence`, `build_default_encounter_manifest`, `validate_encounter_integration`
- Test: `Tests/test_targeted_content.py:ProfileTests, Phase2Tests, SafetyTests`

**Interfaces:**
- Add `progression_clusters(values, gap=15, prefer_high=False)` returning ordered cluster dictionaries with values, width, center, and count.
- Add `apply_sibling_progression_coherence(profiles)` returning `(profiles, comparisons, conflicts)`.
- Preserve `infer_safe_band` output keys and add `candidate_clusters`, `sibling_support`, and `sibling_progression_era_conflict` only as audit fields.

- [ ] **Step 1: Add failing Onyxia-style sibling tests.**

```python
def test_sibling_modern_cluster_overrides_legacy_only_with_real_support(self):
    catalog = _onyxia_style_catalog()

    manifest = g.build_default_encounter_manifest(catalog, 2.0)
    profile = next(row for row in manifest['profiles']
                   if row['difficulty_id'] == 0)

    self.assertGreaterEqual(profile['item_level_min'], 200)
    self.assertTrue(profile['evidence']['sibling_support'])

def test_single_high_level_outlier_does_not_replace_low_level_sibling_cluster(self):
    catalog = _low_level_with_one_outlier_catalog()

    manifest = g.build_default_encounter_manifest(catalog, 2.0)
    profile = manifest['profiles'][0]

    self.assertLess(profile['item_level_max'], 150)
    self.assertFalse(profile['evidence'].get('sibling_support'))

def test_unexplained_sibling_era_conflict_is_reported(self):
    profiles = [_placement_profile('normal', 'raid', (60, 76), (58, 60)),
                _placement_profile('heroic', 'raid', (245, 245), (80, 80))]
    profiles[0]['map_id'] = profiles[1]['map_id'] = 249

    _, _, conflicts = g.apply_sibling_progression_coherence(profiles)

    self.assertTrue(any(row['reason'] == 'sibling_progression_era_conflict'
                        for row in conflicts))
```

- [ ] **Step 2: Run the sibling tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v`

Expected: existing mixed-era tests remain green, while the new sibling support/conflict assertions fail because only the largest independent cluster is retained.

- [ ] **Step 3: Extract reusable cluster candidates.**

Refactor the duplicated gap logic in `_dominant_progression_cluster` and `infer_safe_band` to use `progression_clusters`. Preserve the current fallback choice for profiles without sibling evidence and retain rejected values in `progression_cluster`.

- [ ] **Step 4: Apply sibling support after independent profiles exist.**

Group profiles by map and shared active encounter identity. A sibling-supported alternate cluster must contain at least three stock values, remain within the existing safe width threshold, and have coherent ItemLevel and RequiredLevel proximity to the sibling active cluster. Boost only that candidate cluster; do not choose a highest-level singleton.

- [ ] **Step 5: Recompute affected profile evidence and comparisons.**

After choosing a sibling-supported cluster, recompute profile and encounter bands, required-level ranges, quality counts, rejection values, and prerequisites. Add supporting sibling IDs/reason to `sibling_support`. Keep `difficulty_comparisons` sorted and include independent bands, final bands, LootMode, and reason.

- [ ] **Step 6: Add conflict validation and run profile/safety tests GREEN.**

Record unresolved radical-era siblings as `sibling_progression_era_conflict`. `validate_encounter_integration` must return an error for that conflict only when the profiles share an active encounter family; unrelated maps or explicitly distinct source families remain diagnostic warnings.

Run: `rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v`

Expected: sibling modern evidence wins only with real support, low-level outliers remain rejected, and conflicts fail the optional encounter gate.

- [ ] **Step 7: Commit sibling coherence.**

```text
fix(encounters): align sibling progression eras
```

### Task 5: Separate hard eligibility from deterministic distribution

**Files:**
- Modify: `generate_pack.py:encounter_item_eligibility`, `encounter_placement_score`, `choose_encounter_profile`, `assign_default_encounter_items`
- Test: `Tests/test_targeted_content.py:PlacementTests, SafetyTests`

**Interfaces:**
- Add `encounter_profile_equivalence_group(item, candidates)` returning a deterministic string group ID.
- Add `encounter_profile_weight(item, profile, encounter)` returning a bounded float in `[0.75, 1.25]`.
- Add `choose_distributed_encounter_profile(item, candidates, stable_key=None)` returning the same shape as `choose_encounter_profile` plus `equivalence_group`, `eligible_profile_count`, `distribution_weight`, and `distribution_score`.
- Keep `choose_encounter_profile` as a compatibility wrapper for callers/tests that require the existing score-only selection.

- [ ] **Step 1: Add failing distribution tests.**

```python
def test_equivalent_profiles_receive_deterministic_distribution(self):
    profiles = [_placement_profile(f'heroic_{index}', 'dungeon',
                                   (220, 220), (80, 80))
                for index in range(4)]
    manifest = _placement_manifest(profiles)
    items = [{'entry': 1000 + index, 'ItemLevel': 220,
              'RequiredLevel': 80, 'Quality': 4}
             for index in range(300)]

    g.assign_default_encounter_items(items, manifest)
    first = {item['entry']: item['content_profile'] for item in items}

    reversed_items = [dict(item) for item in reversed(items)]
    for item in reversed_items:
        for key in ('content_profile', 'content_target', 'target_kind',
                    'placement_score', 'placement_reason',
                    'placement_band_source', 'set_atomic_profile',
                    'encounter_equivalence_group',
                    'encounter_eligible_profile_count',
                    'encounter_distribution_weight',
                    'encounter_distribution_score'):
            item.pop(key, None)
    g.assign_default_encounter_items(reversed_items, manifest)
    second = {item['entry']: item['content_profile'] for item in reversed_items}

    self.assertGreater(len(set(first.values())), 1)
    self.assertEqual(first, second)

def test_quality_evidence_is_soft_not_a_dungeon_raid_rule(self):
    dungeon = _placement_profile('dungeon', 'dungeon', (220, 220), (80, 80),
                                 qualities=(3, 4))
    raid = _placement_profile('raid', 'raid', (220, 220), (80, 80),
                              qualities=(4,))
    dungeon['evidence']['quality_counts'] = {3: 20, 4: 2}
    dungeon['evidence']['dominant_quality'] = 3
    raid['evidence']['quality_counts'] = {4: 20}
    raid['evidence']['dominant_quality'] = 4
    manifest = _placement_manifest([dungeon, raid])

    items = [{'entry': 2000 + index, 'ItemLevel': 220,
              'RequiredLevel': 80, 'Quality': 3 if index < 100 else 4}
             for index in range(200)]
    g.assign_default_encounter_items(items, manifest)

    rare_destinations = {item['content_profile'] for item in items[:100]}
    epic_destinations = {item['content_profile'] for item in items[100:]}
    self.assertIn('dungeon', rare_destinations)
    self.assertIn('raid', epic_destinations)
```

- [ ] **Step 2: Run the placement tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.PlacementTests Tests.test_targeted_content.SafetyTests -v`

Expected: the existing safety tests pass, while the new distribution assertions fail because current selection always minimizes one score and does not emit distribution metadata.

- [ ] **Step 3: Keep Stage A eligibility unchanged and expose candidate metadata.**

For each item/profile, call `_eligible_encounters`. Keep all existing hard checks. Select the best eligible encounter per profile only for comparison; do not discard other profiles before equivalence grouping. Quality counts are used only after the hard quality ceiling passes.

- [ ] **Step 4: Implement deterministic equivalence grouping.**

Group candidates only when their safe ItemLevel centers differ by at most 15, RequiredLevel centers differ by at most 3, band widths differ by at most 10, and their active progression clusters are compatible. Use a stable string built from the item level, required level, and normalized candidate band; do not call `hash()`.

- [ ] **Step 5: Implement bounded stock-quality weighting.**

Use `quality_counts`/`dominant_quality` from retained stock evidence as a soft signal. Add small bounded bonuses for dominant-quality match, direct evidence, center fit, and boss target; clamp the final weight to `[0.75, 1.25]`. Do not branch on `map_type` to force Rare to dungeons or Epic to raids.

- [ ] **Step 6: Implement rendezvous selection.**

```python
def choose_distributed_encounter_profile(item, candidates, stable_key=None):
    if not candidates:
        return None
    group=encounter_profile_equivalence_group(item, candidates)
    stable=stable_key if stable_key is not None else item.get('entry')
    scored=[]
    for candidate in candidates:
        profile=candidate['profile']
        weight=encounter_profile_weight(
            item, profile, candidate['encounter'])
        fraction=r01(SEED, stable, group, profile['id'],
                     profile.get('difficulty_id', 0),
                     'encounter-distribution')
        scored.append((fraction * weight, profile['id'], candidate,
                       weight, group))
    score, _, candidate, weight, group = max(
        scored, key=lambda row: (row[0], row[1]))
    return {**candidate, 'equivalence_group': group,
            'eligible_profile_count': len(candidates),
            'distribution_weight': weight,
            'distribution_score': score}
```

- [ ] **Step 7: Apply distribution to ordinary items and sets.**

Use the item entry as the stable key for ordinary items and the set ID as the stable key for atomic sets. Every set member must first pass Stage A in one common profile; then one distributed profile is selected and the existing deterministic boss-slot assignment runs inside it. Preserve world-only behavior when no common candidate exists.

- [ ] **Step 8: Store metadata and run placement tests GREEN.**

Extend `_clear_encounter_metadata` to clear all new keys. Extend `_assign_encounter_metadata` to store the four placement metadata keys. Keep existing `placement_score` and `placement_reason` fields. Run:

```text
rtk py -m unittest Tests.test_targeted_content.PlacementTests Tests.test_targeted_content.SafetyTests Tests.test_targeted_content.LootTests -v
```

Expected: equivalent profiles receive multiple destinations, reversing input order preserves entry mappings, quality evidence affects preference, and all existing set/Legendary/world-only safety tests remain green.

- [ ] **Step 9: Commit deterministic distribution.**

```text
feat(encounters): distribute equivalent loot
```

### Task 6: Add distribution audits and the Phase 3 safety gate

**Files:**
- Modify: `generate_pack.py:validate_encounter_integration` and encounter report construction
- Test: `Tests/test_targeted_content.py:SafetyTests, ReportTests`

**Interfaces:**
- Add `build_encounter_distribution_audit(items)` returning sorted rows with the requested audit columns.
- Extend `validate_encounter_integration(items, manifest, records, catalog)` to validate distribution concentration, sibling conflicts, reference provenance, and gameobject reward validity.
- Return `distribution_audit`, `reference_provenance`, and `gameobject_reward_targets` in the validation summary without removing existing keys.

- [ ] **Step 1: Add failing audit and concentration tests.**

```python
def test_distribution_audit_reports_entropy_and_dominant_share(self):
    items = []
    for index in range(120):
        items.append({
            'entry': 3000 + index,
            'RequiredLevel': 80,
            'ItemLevel': 220,
            'Quality': 4,
            'content_profile': 'heroic_a' if index < 70 else 'heroic_b',
            'encounter_equivalence_group': '80-220',
            'encounter_eligible_profile_count': 3,
        })

    rows = g.build_encounter_distribution_audit(items)

    self.assertEqual(rows[0]['items_placed'], 120)
    self.assertEqual(rows[0]['dominant_profile'], 'heroic_a')
    self.assertGreater(rows[0]['distribution_entropy'], 0)
    self.assertTrue(rows[0]['warning'])

def test_broken_selector_fails_distribution_safety_gate(self):
    profile = _placement_profile('heroic_a', 'dungeon', (220, 220), (80, 80))
    manifest = {'profiles': [profile], 'coverage': []}
    items = [{
        'entry': 4000 + index, 'RequiredLevel': 80,
        'ItemLevel': 220, 'Quality': 4,
        'content_profile': 'heroic_a', 'content_target': 'boss',
        'encounter_equivalence_group': '80-220',
        'encounter_eligible_profile_count': 5,
    } for index in range(300)]

    report = g.validate_encounter_integration(items, manifest, [], {})

    self.assertFalse(report['valid'])
    self.assertTrue(any('distribution' in error.lower()
                        for error in report['errors']))
```

- [ ] **Step 2: Run the safety tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.SafetyTests Tests.test_targeted_content.ReportTests -v`

Expected: existing validation tests pass and the new distribution assertions fail because no audit or concentration error exists.

- [ ] **Step 3: Implement the audit aggregation.**

Group placed items by `(encounter_equivalence_group, RequiredLevel, ItemLevel, Quality)`. Count eligible profiles, placements, and profile frequencies. Compute dominant profile/share and Shannon entropy with `-sum(p * log(p))` for nonzero shares; use `0` for one-profile groups. Emit the exact fields:

```text
equivalence_group,RequiredLevel,ItemLevel,quality,
eligible_profile_count,items_placed,dominant_profile,
dominant_profile_share,distribution_entropy,warning
```

- [ ] **Step 4: Implement warning/error thresholds.**

Add a warning at `3+` eligible profiles, `100+` items, and dominant share `> 0.80`. Add an error at `5+` eligible profiles, `250+` items, and dominant share `> 0.95`. Do not penalize groups with fewer profiles/items or materially distinct candidates.

- [ ] **Step 5: Validate sibling conflicts and report summaries.**

Have `validate_encounter_integration` reject unresolved `sibling_progression_era_conflict`, include all distribution errors/warnings, and preserve current profile, target, RequiredLevel, quality, set, Legendary, and coverage validation. The returned summary must contain the audit rows and provenance/reward-object counts.

- [ ] **Step 6: Run focused safety/report tests GREEN.**

Run: `rtk py -m unittest Tests.test_targeted_content.SafetyTests Tests.test_targeted_content.ReportTests -v`

Expected: broken concentration fails the optional encounter gate, entropy and warnings are correct, and existing safety behavior remains unchanged.

- [ ] **Step 7: Commit distribution validation.**

```text
test(encounters): gate distribution collapse
```

### Task 7: Emit complete reports and safe gameobject SQL

**Files:**
- Modify: `generate_pack.py:write_placement_reports`, `render_encounter_loot_sql`, `write_outputs`, collision/cleanup/schema SQL construction, generated README template
- Test: `Tests/test_targeted_content.py:ReportTests, LootTests, RuntimeTests`

**Interfaces:**
- `write_placement_reports` returns paths for `distribution`, `reference_provenance`, and `gameobject_rewards` in addition to existing paths.
- `render_encounter_loot_sql` maps `creature`, `reference`, and `gameobject` to their exact tables.
- Output collision/rollback SQL includes exact gameobject attachment predicates and `SHOW COLUMNS` for `gameobject_loot_template`.

- [ ] **Step 1: Add failing report and SQL tests.**

```python
def test_phase3_reports_have_fixed_headers(self):
    with tempfile.TemporaryDirectory() as directory:
        paths = g.write_placement_reports(
            [], {'pools': [], 'attachments': []}, [],
            pathlib.Path(directory),
            {'profiles': [], 'distribution_audit': [],
             'reference_provenance': [],
             'gameobject_reward_targets': []}, {})

        distribution_header = paths['distribution'].read_text(
            encoding='utf-8').splitlines()[0]
        provenance_header = paths['reference_provenance'].read_text(
            encoding='utf-8').splitlines()[0]
        gameobject_header = paths['gameobject_rewards'].read_text(
            encoding='utf-8').splitlines()[0]

    self.assertIn('dominant_profile_share', distribution_header)
    self.assertIn('verified_parent', provenance_header)
    self.assertIn('association_method', gameobject_header)

def test_collision_and_schema_sql_include_gameobject_table(self):
    # Use the existing output fixture helper and inspect generated text.
    output = _write_small_output_with_gameobject_target()
    collision = (output / '00_PREIMPORT_COLLISION_CHECK.sql').read_text()
    schema = (output / '00_SCHEMA_CHECK.sql').read_text()
    rollback = (output / '99_REMOVE_GENERATED_ITEMS.sql').read_text()

    self.assertIn('generated_encounter_gameobject_attachment_collision_count', collision)
    self.assertIn('SHOW COLUMNS FROM `acore_world`.`gameobject_loot_template`', schema)
    self.assertIn('DELETE FROM `gameobject_loot_template`', rollback)
```

- [ ] **Step 2: Run report/SQL tests and verify RED.**

Run: `rtk py -m unittest Tests.test_targeted_content.ReportTests Tests.test_targeted_content.LootTests Tests.test_targeted_content.RuntimeTests -v`

Expected: new Phase 3 path/header and schema assertions fail; existing table-specific gameobject rendering tests remain green.

- [ ] **Step 3: Add fixed-order report writers.**

Write `encounter_distribution_audit.csv`, `encounter_reference_provenance.csv`, and `gameobject_reward_targets.csv` on every run, including invalid/empty integrations. Sort by group/level/quality, reference/map/difficulty, and profile/map/difficulty/gameobject/guid respectively. Add the four placement metadata columns to `dungeon_raid_item_placements.csv`.

- [ ] **Step 4: Thread audit data through `write_outputs`.**

Build audit rows after assignment and before output gating. Pass manifest/catalog audit data to `write_placement_reports`. Include report-relative paths, source statuses, and audit summaries in `validation_report.json` without changing existing core report keys.

- [ ] **Step 5: Verify table-specific encounter SQL and cleanup.**

Keep the existing mapping:

```python
{'creature': 'creature_loot_template',
 'reference': 'reference_loot_template',
 'gameobject': 'gameobject_loot_template'}
```

Use exact generated pool/attachment predicates only. Add gameobject conditions to the main collision check and rollback construction rather than appending a second unrelated transaction. Preserve additive stock rows.

- [ ] **Step 6: Add gameobject schema and README contracts.**

Add `SHOW COLUMNS FROM acore_world.gameobject_loot_template` to `00_SCHEMA_CHECK.sql`. Document optional source discovery, `Data1`, association methods, report names, `script_reward_mapping`, and the invalid-encounter import gate in the generated README template.

- [ ] **Step 7: Run report/SQL tests GREEN.**

Run: `rtk py -m unittest Tests.test_targeted_content.ReportTests Tests.test_targeted_content.LootTests Tests.test_targeted_content.RuntimeTests -v`

Expected: all new report headers, table names, cleanup predicates, schema checks, and existing loot/report tests pass.

- [ ] **Step 8: Commit report and SQL output changes.**

```text
feat(encounters): emit phase 3 audits
```

### Task 8: Update architecture documentation and run acceptance verification

**Files:**
- Modify: `Architecture.md` encounter and import sections
- Test/check: `Tests/test_targeted_content.py`, command-level checks, temporary output directories only

- [ ] **Step 1: Add a documentation contract check before editing.**

Run:

```text
rtk rg -n -i "Data1|distribution|equivalence|sibling_progression|reference_provenance|gameobject_reward_targets|script_reward_mapping|world-only|fail closed|IMPORT_ORDER" Architecture.md generate_pack.py
```

Record the missing terms; do not change code during this check.

- [ ] **Step 2: Update `Architecture.md`.**

Document that complete gameobject SQL files in `Data/` are auto-discovered, `Data1` is the loot relationship, map-only chests are not boss-associated, script mapping requires explicit completion-path evidence, shared references require verified parents, sibling coherence requires a real alternate cluster, equivalent placement uses BLAKE2b rendezvous, and distribution/reference/gameobject audits are always emitted.

- [ ] **Step 3: Run the complete unit suite and static checks.**

Run:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
rtk git diff --check
```

Expected: all tests pass and no whitespace errors are reported.

- [ ] **Step 4: Run two deterministic small generations without touching existing generated outputs.**

Use a temporary output override in a one-shot Python command that calls `configure_runtime`, sets `g.OUT` and `g.SQLDIR` to two separate `TemporaryDirectory` paths, then runs the same finalized-item/write-output pipeline twice with seed `2070213938`. Compare `dungeon_raid_item_placements.csv`, `encounter_loot.csv`, `encounter_distribution_audit.csv`, `encounter_reference_provenance.csv`, `gameobject_reward_targets.csv`, and encounter SQL byte-for-byte. Do not run the CLI against the existing `generated-2070213938/` directory.

- [ ] **Step 5: Run the 100,000-item acceptance generation in a temporary output directory.**

Use the same temporary-output harness with seed `2070213938` and the supplied `Data/` files. Inspect:

```text
validation_report.json
encounter_profile_coverage.csv
encounter_profiles.csv
difficulty_band_comparison.csv
encounter_distribution_audit.csv
encounter_reference_provenance.csv
gameobject_reward_targets.csv
dungeon_raid_item_placements.csv
set_manifest.csv
sql/IMPORT_ORDER.txt
```

Expected: 100,000 unique items/names, clean core validation, no unsafe low-level contamination, RequiredLevel and ItemLevel-compatible placements, atomic sets, no Legendary trash, multiple equivalent destinations where the audit says profiles are equivalent, and encounter SQL only when encounter validation is valid. Preserve the existing `generated-2070213938/` and `.zip` unchanged.

- [ ] **Step 6: Verify the final worktree boundary.**

Run:

```text
rtk git status --short
rtk git diff --stat
```

Expected: only `generate_pack.py`, `Tests/test_targeted_content.py`, `Architecture.md`, and the committed Phase 3 design/plan are tracked changes; existing untracked generated outputs and ignored `Data/*.sql` remain untouched.

- [ ] **Step 7: Commit documentation and acceptance code changes.**

```text
docs(encounters): document phase 3 behavior
```

## Final Verification Checklist

- [ ] All focused tests and the complete `unittest` suite pass.
- [ ] `rtk git diff --check` passes.
- [ ] Complete `Data/` gameobject trio auto-discovers; partial explicit input fails clearly; absent optional input is `not_exercised`.
- [ ] Chest loot uses `gameobject_template.Data1` and only type-3 objects.
- [ ] Map-only chests remain audit-visible but are never guessed as boss rewards.
- [ ] Explicit script completion-path summons are accepted; same-file symbol co-occurrence is rejected.
- [ ] Shared references are rejected without context and accepted only through verified difficulty-specific creature/gameobject parents.
- [ ] Sibling coherence supports a real alternate cluster and protects against one-row high-level outliers.
- [ ] Equivalent safe profiles distribute deterministically independent of input order.
- [ ] Stock quality changes soft preference without a hardcoded dungeon/raid quality rule.
- [ ] Generated sets remain one profile or entirely world-only.
- [ ] Distribution concentration thresholds are audited and gate encounter SQL.
- [ ] New audit CSVs and evidence columns have fixed deterministic headers/order.
- [ ] Gameobject SQL, collision checks, schema checks, cleanup, and rollback use the correct table and exact generator-owned predicates.
- [ ] Invalid encounter integration preserves item/world output and omits encounter imports.
- [ ] The existing untracked generated pack, zip, and ignored source data remain unchanged.
- [ ] Live server/client behavior is not claimed by static/source-backed verification.
