# Targeted Content Generation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add deterministic manifest-driven generation, encounter-aware additive dungeon/raid loot, and safe fixed/choice quest rewards while preserving the current no-manifest generator.

**Architecture:** Keep the existing `generate_pack.py` pipeline and add pure manifest/planning helpers beside the current loot helpers. A manifest creates an explicit item assignment plan before skeleton generation; finalized items retain assignment metadata so output writers can create one independent loot pool per encounter and fill empty quest slots without rewriting unrelated rows.

**Tech Stack:** Python standard library, `unittest`, existing SQL/DBC writers, JSON manifests.

**Spec:** `docs/superpowers/specs/2026-09-08-targeted-content-generation-design.md`

## Global Constraints

- Preserve no-manifest behavior and existing world-loot bracket output.
- Required level and item level are independent constraints.
- Recipe counts are disjoint unless explicitly marked overlapping.
- Normal, Heroic, 10-player, and 25-player targets are separate profiles.
- Encounter ordering comes from explicit prerequisites; never infer it from SQL row order.
- Generated dungeon/raid loot is additive and independent from existing loot.
- Existing quest rewards are preserved and empty slots are filled by default.
- Use only the Python standard library; do not add dependencies.
- Leave the pre-existing untracked `Old Versions/generate_pack v3.4.py` untouched.

---

### Task 1: Add manifest parsing and encounter graph resolution

**Files:**
- Create: `test_targeted_content.py`
- Modify: `generate_pack.py:arg parsing and loot helper area`
- Create: `content_manifest.example.json`

**Interfaces:**
- `load_content_manifest(path: Path) -> dict`
- `validate_content_manifest(manifest: dict) -> dict`
- `resolve_encounter_order(profile: dict) -> list[dict]`
- `allocate_weighted_counts(total: int, targets: list[dict]) -> dict[str, int]`

- [ ] **Step 1: Write failing tests for manifest validation and graph ordering**

```python
def test_resolve_encounter_order_uses_prerequisites():
    profile = {
        'id': 'sample',
        'encounters': [
            {'id': 'final', 'kind': 'boss', 'requires': ['wing_a', 'wing_b']},
            {'id': 'wing_b', 'kind': 'boss', 'requires': []},
            {'id': 'wing_a', 'kind': 'boss', 'requires': []},
        ],
    }
    resolved = g.resolve_encounter_order(profile)
    self.assertEqual([row['id'] for row in resolved], ['wing_a', 'wing_b', 'final'])
    self.assertEqual([row['rank'] for row in resolved], [0, 0, 1])

def test_manifest_rejects_encounter_cycles():
    profile = {'id': 'bad', 'encounters': [
        {'id': 'a', 'kind': 'boss', 'requires': ['b']},
        {'id': 'b', 'kind': 'boss', 'requires': ['a']},
    ]}
    with self.assertRaises(ValueError):
        g.resolve_encounter_order(profile)

def test_weighted_counts_preserve_exact_total():
    targets = [{'id': 'trash', 'weight': 1}, {'id': 'boss', 'weight': 3}]
    self.assertEqual(g.allocate_weighted_counts(10, targets), {'trash': 3, 'boss': 7})
```

- [ ] **Step 2: Run the focused tests and confirm they fail because the helpers do not exist**

Run: `py -m unittest test_targeted_content.ManifestTests -v`

Expected: FAIL with missing helper attributes or equivalent feature-not-implemented errors.

- [ ] **Step 3: Implement the standard-library manifest loader, validator, deterministic topological resolver, and largest-remainder weighted allocator**

The resolver must reject duplicate IDs, missing prerequisites, duplicate target IDs, and cycles. It must assign the same rank to ready branch nodes and sort ties by stable encounter ID. The allocator must assign every unit, give nonzero targets at least one unit when feasible, and break remainders by stable target ID.

- [ ] **Step 4: Run the focused tests and confirm they pass**

Run: `py -m unittest test_targeted_content.ManifestTests -v`

Expected: PASS.

- [ ] **Step 5: Add a small `content_manifest.example.json` covering one difficulty profile, two prerequisite-linked bosses, trash, one recipe, and one quest target**

- [ ] **Step 6: Run JSON parsing and focused tests again**

Run: `py -m unittest test_targeted_content.ManifestTests -v`

Expected: PASS with no warnings.

- [ ] **Step 7: Commit the manifest foundation**

```powershell
git add generate_pack.py test_targeted_content.py content_manifest.example.json
git commit -m "feat: add targeted content manifest planning"
```

---

### Task 2: Add disjoint recipe planning and targeted skeleton generation

**Files:**
- Modify: `generate_pack.py:parse_args, configure_runtime, build_skeletons`
- Modify: `test_targeted_content.py`

**Interfaces:**
- `build_generation_plan(manifest: dict, available_classes: list[tuple]) -> list[dict]`
- `build_targeted_skeletons(plan: list[dict], ui=None) -> list[dict]`
- `choose_recipe_class(recipe: dict, index: int) -> str`
- `choose_recipe_level(recipe: dict, index: int) -> int`
- `choose_recipe_item_level(recipe: dict, required_level: int, index: int) -> int`

- [ ] **Step 1: Write failing tests for disjoint quotas and independent level ranges**

```python
def test_generation_plan_keeps_recipe_counts_disjoint():
    manifest = {'recipes': [
        {'id': 'epics', 'count': 4, 'quality': 4},
        {'id': 'warrior_weapons', 'count': 2, 'class': 'Warrior', 'kind': 'weapon'},
    ]}
    plan = g.build_generation_plan(manifest, g.CLASSES)
    self.assertEqual(len(plan), 6)
    self.assertEqual(sum(row['recipe_id'] == 'epics' for row in plan), 4)
    self.assertEqual(sum(row['recipe_id'] == 'warrior_weapons' for row in plan), 2)

def test_targeted_skeleton_honors_required_and_item_level_ranges():
    plan = [{'recipe_id': 'sample', 'index': 0, 'class_name': 'Warrior',
             'required_level_min': 30, 'required_level_max': 50,
             'item_level_min': 100, 'item_level_max': 115,
             'quality': 4}]
    skeletons = g.build_targeted_skeletons(plan)
    self.assertTrue(30 <= skeletons[0]['required_level'] <= 50)
    self.assertTrue(100 <= skeletons[0]['item_level'] <= 115)
```

- [ ] **Step 2: Run the tests and confirm they fail**

Run: `py -m unittest test_targeted_content.PlannerTests -v`

Expected: FAIL because targeted planning is not implemented.

- [ ] **Step 3: Implement manifest CLI loading and exact recipe planning**

Add `--content-manifest PATH` with no-manifest compatibility. The planner must expand set recipes into piece reservations, reject impossible counts before output, assign stable class-local entries, and attach recipe/profile/target metadata to each skeleton. A recipe with no class chooses deterministically among playable classes; class-constrained recipes use the requested class.

- [ ] **Step 4: Implement targeted skeleton generation by reusing existing role, structure, appearance, and stat helpers**

Use the recipe/profile range intersection for required level and item level. Use fixed quality when requested; otherwise use the existing quality policy. Preserve existing `finish_items()` and validation contracts.

- [ ] **Step 5: Run focused planner tests and the existing regression suite**

Run: `py -m unittest test_targeted_content.PlannerTests -v`

Run: `py -m unittest test_cli_ui.py -v`

Expected: PASS.

- [ ] **Step 6: Commit the targeted generation planner**

```powershell
git add generate_pack.py test_targeted_content.py
git commit -m "feat: plan disjoint targeted item recipes"
```

---

### Task 3: Add encounter progression and additive dungeon/raid loot records

**Files:**
- Modify: `generate_pack.py:loot helpers and output writer`
- Modify: `test_targeted_content.py`

**Interfaces:**
- `build_encounter_loot_records(items: list[dict], profile: dict, source_rows: dict) -> dict`
- `encounter_item_level_band(profile: dict, encounter: dict, resolved: list[dict]) -> tuple[int, int]`
- `validate_loot_targets(profile: dict, source_rows: dict) -> None`

- [ ] **Step 1: Write failing tests for progression, weighted assignment, additive chances, and quantity defaults**

```python
def test_encounter_progression_ends_at_profile_maximum():
    profile = {'item_level_min': 200, 'item_level_max': 240,
               'encounters': [
                   {'id': 'first', 'kind': 'boss', 'requires': []},
                   {'id': 'last', 'kind': 'boss', 'requires': ['first']},
               ]}
    resolved = g.resolve_encounter_order(profile)
    self.assertEqual(g.encounter_item_level_band(profile, resolved[0], resolved)[0], 200)
    self.assertEqual(g.encounter_item_level_band(profile, resolved[-1], resolved)[1], 240)

def test_encounter_loot_allocates_weighted_items_and_defaults_to_one_drop():
    items = [{'entry': 1, 'content_target': 'boss', 'content_profile': 'sample'}] * 3
    profile = {'id': 'sample', 'additional_drop_chance': 12.5,
               'encounters': [{'id': 'boss', 'kind': 'boss', 'requires': [], 'weight': 3}]}
    records = g.build_encounter_loot_records(items, profile, {'boss': [9001]})
    self.assertEqual(records['encounters']['boss']['quantity'], 1)
    self.assertEqual(records['encounters']['boss']['chance'], 12.5)
```

- [ ] **Step 2: Run the tests and confirm they fail**

Run: `py -m unittest test_targeted_content.LootTests -v`

Expected: FAIL because encounter records are not implemented.

- [ ] **Step 3: Implement profile validation against supplied creature/reference SQL mappings**

Reject missing targets, duplicate target ownership, invalid chances/quantities, and incomplete encounter references before writing output.

- [ ] **Step 4: Implement rank-based item-level bands and weighted deterministic assignment**

Use explicit encounter ranges when present. Otherwise interpolate between profile floor and maximum by resolved rank, with the final encounter upper bound forced to the profile maximum. Allocate exact item counts to trash/boss targets using stable weights and preserve assignment metadata.

- [ ] **Step 5: Implement independent generated reference pools and attachments**

Create one pool per encounter. Attach it to the mapped target with an independent additional-drop chance, `MinCount=MaxCount=1` by default, and optional per-encounter quantity overrides. Do not modify existing rows or reuse existing groups.

- [ ] **Step 6: Run loot tests and the existing suite**

Run: `py -m unittest test_targeted_content.LootTests -v`

Run: `py -m unittest test_cli_ui.py -v`

Expected: PASS.

- [ ] **Step 7: Commit additive encounter loot**

```powershell
git add generate_pack.py test_targeted_content.py
git commit -m "feat: add encounter-aware additive loot"
```

---

### Task 4: Add safe fixed and choice quest reward output

**Files:**
- Modify: `generate_pack.py:runtime arguments and output writer`
- Modify: `test_targeted_content.py`

**Interfaces:**
- `load_quest_reward_slots(path: Path, quest_ids: set[int]) -> dict[int, dict]`
- `build_quest_reward_records(items: list[dict], targets: list[dict], source_rows: dict) -> dict`
- `write_quest_reward_sql(records: dict, output_path: Path, cleanup_path: Path) -> None`

- [ ] **Step 1: Write failing tests for fixed/choice slot selection and preservation**

```python
def test_quest_rewards_fill_empty_fixed_and_choice_slots_only():
    source = {100: {'fixed': [0, 900], 'choice': [0, 0, 901]}}
    targets = [{'quest_id': 100, 'mode': 'fixed'}, {'quest_id': 100, 'mode': 'choice'}]
    items = [{'entry': 7001}, {'entry': 7002}]
    records = g.build_quest_reward_records(items, targets, source)
    self.assertEqual(records[0]['column'], 'RewardItemId1')
    self.assertEqual(records[1]['column'], 'RewardChoiceItemId1')
```

- [ ] **Step 2: Run the tests and confirm they fail**

Run: `py -m unittest test_targeted_content.QuestTests -v`

Expected: FAIL because quest reward planning is not implemented.

- [ ] **Step 3: Add `--quest-template-source PATH` and parse only requested quest rows**

Validate requested quest IDs and the AzerothCore WotLK reward columns needed for fixed and choice slots. Preserve source values in the report for cleanup generation.

- [ ] **Step 4: Implement empty-slot assignment and explicit overwrite opt-in**

Fixed rewards use the available `RewardItemId`/count columns; choice rewards use the available `RewardChoiceItemId`/count columns. Reject occupied slots by default and reject duplicate assignments unless explicitly allowed.

- [ ] **Step 5: Write additive quest SQL and reversible cleanup SQL**

Emit only targeted `UPDATE quest_template` statements. Cleanup restores the exact prior values recorded in the generated report.

- [ ] **Step 6: Run quest tests and the existing suite**

Run: `py -m unittest test_targeted_content.QuestTests -v`

Run: `py -m unittest test_cli_ui.py -v`

Expected: PASS.

- [ ] **Step 7: Commit quest reward output**

```powershell
git add generate_pack.py test_targeted_content.py
git commit -m "feat: add safe quest reward assignments"
```

---

### Task 5: Integrate reports, documentation, and full verification

**Files:**
- Modify: `generate_pack.py:validation report and main pipeline`
- Modify: `README.md`
- Modify: `CLI_UI.md`
- Modify: `content_manifest.example.json`
- Modify: `test_targeted_content.py`

- [ ] **Step 1: Write failing report assertions**

Assert the manifest run reports recipe counts, encounter order/ranks, per-target counts/chances/quantities, quest assignments, and generated IDs.

- [ ] **Step 2: Run the report tests and confirm they fail**

Run: `py -m unittest test_targeted_content.ReportTests -v`

Expected: FAIL because targeted report fields are not yet emitted.

- [ ] **Step 3: Add report fields and CLI/UI phase messages**

Keep existing no-manifest report keys intact and add targeted sections only when the manifest is active.

- [ ] **Step 4: Document manifest usage, encounter graph rules, progression, weighted allocation, additive chances, and quest slot preservation**

- [ ] **Step 5: Run all tests and a small manifest generation smoke test**

Run: `py -m unittest discover -v`

Run: `py .\generate_pack.py --content-manifest .\content_manifest.example.json --number 10 --ui plain`

Expected: exit code 0, generated report contains targeted sections, generated SQL contains only generated loot/quest changes, and pre-existing files remain untouched.

- [ ] **Step 6: Run repository diff checks**

Run: `git diff --check`

Run: `git status --short`

Expected: no whitespace errors; the pre-existing untracked old-version file remains unmodified.

- [ ] **Step 7: Commit the integrated feature**

```powershell
git add generate_pack.py README.md CLI_UI.md test_targeted_content.py content_manifest.example.json
git commit -m "feat: add manifest-driven dungeon and quest content"
```
