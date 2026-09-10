# Task 2 report: discover and audit static/scripted reward gameobjects

Date: 2026-09-10

## Scope

Implemented only Task 2 of the Phase 3 encounter-loot plan:

- static type-3, positive-Data1 reward-object discovery;
- explicit credit-type-1 instance-encounter association by resolved map;
- conservative completion-path `SummonGameObject` scanning;
- reward-target audit propagation into the default manifest;
- `gameobject_reward_targets.csv` with the required fixed header.

No reference-provenance, sibling-coherence, distribution, database writes, new dependencies, or generated Data/processed-output changes were made.

## TDD evidence

### RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests.test_static_chest_uses_map_and_data1_without_fuzzy_boss_association Tests.test_targeted_content.SourceTests.test_gameobject_instance_mapping_is_valid_only_for_the_matching_map -v
```

Result before implementation:

```text
test_static_chest_uses_map_and_data1_without_fuzzy_boss_association ... ERROR
AttributeError: module 'generator' has no attribute 'discover_gameobject_reward_targets'
test_gameobject_instance_mapping_is_valid_only_for_the_matching_map ... ERROR
AttributeError: module 'generator' has no attribute 'discover_gameobject_reward_targets'
Ran 2 tests in 0.001s
FAILED (errors=2)
```

### GREEN: focused discovery tests

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests.test_static_chest_uses_map_and_data1_without_fuzzy_boss_association Tests.test_targeted_content.SourceTests.test_gameobject_instance_mapping_is_valid_only_for_the_matching_map Tests.test_targeted_content.SourceTests.test_explicit_done_path_summon_maps_script_reward Tests.test_targeted_content.SourceTests.test_same_file_symbol_cooccurrence_is_not_script_reward_evidence -v
```

Result:

```text
Ran 4 tests in 0.019s
OK
```

### GREEN: covering source/report suites

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests Tests.test_targeted_content.ReportTests -v
```

Result:

```text
Ran 18 tests in 14.922s
OK
```

### GREEN: auxiliary current suites

Command:

```text
rtk py -m unittest discover -s Tests -v
```

Result:

```text
Ran 91 tests in 44.309s
OK
```

## Implementation notes

`discover_gameobject_reward_targets` resolves each spawn through `id` to the template entry, then uses only the template's Data1-derived `lootid` to validate `gameobject_loot_template.Entry`. Map-only matches remain invalid audit rows with a boss-association reason and are not added to encounter bosses. Credit-type-1 rows become valid only when `last_encounter_dungeon` resolves to the spawn's map.

`discover_script_reward_mappings` scans the supplied source root (or `src/server/scripts/` when present), resolves numeric `GO_*` constants, and requires an explicit summon call within a function block containing a DONE encounter-completion condition. Same-file symbol co-occurrence is rejected. A supplied root reports `exercised` even when no mapping is found; no root reports `not_exercised`.

## Changed files

- `generate_pack.py`
- `Tests/test_targeted_content.py`
- this report

