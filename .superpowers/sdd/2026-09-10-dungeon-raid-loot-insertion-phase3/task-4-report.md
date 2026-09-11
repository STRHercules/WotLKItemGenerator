# Task 4 report: preserve progression clusters and apply sibling coherence

## Scope

Implemented source-backed sibling progression coherence at the existing encounter-manifest seam. Independent candidate clusters are retained as audit evidence; a sibling can support an alternate only when it shares the map and active encounter family and supplies a coherent bounded cluster with at least three values. Unresolved radical-era siblings are recorded and only active-family conflicts fail encounter integration validation.

No deterministic distribution, output gating, scanner changes, dependency/module/database changes, generated-output edits, or new IDs were made.

## TDD RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact result before implementation:

```text
Ran 29 tests in 0.009s

FAILED (failures=2, errors=1)
```

The failures were the missing sibling override, missing `apply_sibling_progression_coherence` API, and missing conflict validation.

## Covering tests

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact output:

```text
test_coverage_keeps_excluded_candidate_visible (Tests.test_targeted_content.ProfileTests.test_coverage_keeps_excluded_candidate_visible) ... ok
test_default_profiles_use_stock_bands_per_difficulty (Tests.test_targeted_content.ProfileTests.test_default_profiles_use_stock_bands_per_difficulty) ... ok
test_explicit_and_script_associations_remain_separate (Tests.test_targeted_content.ProfileTests.test_explicit_and_script_associations_remain_separate) ... ok
test_gameobject_reward_becomes_first_class_encounter_target (Tests.test_targeted_content.ProfileTests.test_gameobject_reward_becomes_first_class_encounter_target) ... ok
test_map_only_gameobject_audit_never_becomes_encounter_target (Tests.test_targeted_content.ProfileTests.test_map_only_gameobject_audit_never_becomes_encounter_target) ... ok
test_multiple_instance_mappings_remain_distinct_in_profile (Tests.test_targeted_content.ProfileTests.test_multiple_instance_mappings_remain_distinct_in_profile) ... ok
test_script_only_reward_mapping_creates_profile_target (Tests.test_targeted_content.ProfileTests.test_script_only_reward_mapping_creates_profile_target) ... ok
test_script_reward_mapping_propagates_to_audited_target (Tests.test_targeted_content.ProfileTests.test_script_reward_mapping_propagates_to_audited_target) ... ok
test_sibling_modern_cluster_overrides_legacy_only_with_real_support (Tests.test_targeted_content.ProfileTests.test_sibling_modern_cluster_overrides_legacy_only_with_real_support) ... ok
test_single_high_level_outlier_does_not_replace_low_level_sibling_cluster (Tests.test_targeted_content.ProfileTests.test_single_high_level_outlier_does_not_replace_low_level_sibling_cluster) ... ok
test_difficulty_profile_uses_effective_creature_template_and_loot (Tests.test_targeted_content.Phase2Tests.test_difficulty_profile_uses_effective_creature_template_and_loot) ... ok
test_difficulty_reference_requires_exact_consumer_difficulty (Tests.test_targeted_content.Phase2Tests.test_difficulty_reference_requires_exact_consumer_difficulty) ... ok
test_difficulty_variant_reference_consumer_maps_to_base_spawn (Tests.test_targeted_content.Phase2Tests.test_difficulty_variant_reference_consumer_maps_to_base_spawn) ... ok
test_encounter_sql_rejects_required_level_outside_retained_band (Tests.test_targeted_content.Phase2Tests.test_encounter_sql_rejects_required_level_outside_retained_band) ... ok
test_filtered_encounters_rebuild_prerequisites (Tests.test_targeted_content.Phase2Tests.test_filtered_encounters_rebuild_prerequisites) ... ok
test_gameobject_support_is_not_exercised_without_sources (Tests.test_targeted_content.Phase2Tests.test_gameobject_support_is_not_exercised_without_sources) ... ok
test_heroic_coverage_failure_invalidates_encounter_integration (Tests.test_targeted_content.Phase2Tests.test_heroic_coverage_failure_invalidates_encounter_integration) ... ok
test_mixed_era_raid_keeps_active_boss_cluster (Tests.test_targeted_content.Phase2Tests.test_mixed_era_raid_keeps_active_boss_cluster) ... ok
test_nested_reference_provenance_recomputes_consumer_counts (Tests.test_targeted_content.Phase2Tests.test_nested_reference_provenance_recomputes_consumer_counts) ... ok
test_prerequisite_rebuild_clears_removed_parents (Tests.test_targeted_content.Phase2Tests.test_prerequisite_rebuild_clears_removed_parents) ... ok
test_profile_range_contradiction_invalidates_encounter_integration (Tests.test_targeted_content.Phase2Tests.test_profile_range_contradiction_invalidates_encounter_integration) ... ok
test_raid_difficulty_profiles_resolve_all_four_template_variants (Tests.test_targeted_content.Phase2Tests.test_raid_difficulty_profiles_resolve_all_four_template_variants) ... ok
test_raid_trash_only_candidate_is_excluded (Tests.test_targeted_content.Phase2Tests.test_raid_trash_only_candidate_is_excluded) ... ok
test_unexplained_sibling_era_conflict_is_reported (Tests.test_targeted_content.Phase2Tests.test_unexplained_sibling_era_conflict_is_reported) ... ok
test_verified_difficulty_parent_can_use_shared_reference (Tests.test_targeted_content.Phase2Tests.test_verified_difficulty_parent_can_use_shared_reference) ... ok
test_verified_heroic_culling_reference_is_contextual_not_hardcoded (Tests.test_targeted_content.Phase2Tests.test_verified_heroic_culling_reference_is_contextual_not_hardcoded) ... ok
test_active_sibling_era_conflict_invalidates_encounter_integration (Tests.test_targeted_content.SafetyTests.test_active_sibling_era_conflict_invalidates_encounter_integration) ... ok
test_encounter_validation_rejects_out_of_band_required_level (Tests.test_targeted_content.SafetyTests.test_encounter_validation_rejects_out_of_band_required_level) ... ok
test_encounter_validation_rejects_split_set (Tests.test_targeted_content.SafetyTests.test_encounter_validation_rejects_split_set) ... ok

----------------------------------------------------------------------
Ran 29 tests in 0.008s

OK
```

## Full suite

Command:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
```

Exact output:

```text
..................................................................................................................
----------------------------------------------------------------------
Ran 114 tests in 54.103s

OK
```

## Additional checks

Command:

```text
rtk py -m py_compile generate_pack.py Tests/test_targeted_content.py
```

Exact output:

```text

```

## Round 2 fix report

### Scope

Mixed raid profiles now use the final `raid_profile` width limit for sibling candidates, so a width-26 alternate is rejected before it can override a valid profile. If sibling-adjusted evidence is invalid for any remaining reason, the affected profile is marked invalid with its evidence reason. Existing paired ItemLevel/RequiredLevel coherence and rejection metadata are preserved.

### TDD RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.Phase2Tests.test_mixed_raid_sibling_width_cannot_become_valid_profile -v
```

Exact output:

```text
test_mixed_raid_sibling_width_cannot_become_valid_profile (Tests.test_targeted_content.Phase2Tests.test_mixed_raid_sibling_width_cannot_become_valid_profile) ... FAIL

----------------------------------------------------------------------
Ran 1 test in 0.001s

FAILED (failures=1)
```

### Covering verification

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact result:

```text
Ran 33 tests in 0.009s

OK
```

### Full suite

Command:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
```

Exact result:

```text
Ran 118 tests in 55.952s

OK
```

### Additional checks

Command:

```text
rtk py -m py_compile generate_pack.py Tests/test_targeted_content.py
```

Exact output:

```text

```

Command:

```text
rtk git diff --check
```

Exact output:

```text

```

## Round 1 fix report

### Scope

Addressed the review findings without changing Task 2 scanner/gameobject behavior, Task 3 reference behavior, or distribution/output gating. Sibling alternate support now derives RequiredLevel evidence from the same stock records as the candidate ItemLevel cluster; candidate width validation reuses the centralized encounter/profile threshold logic; and sibling recomputation preserves rejection reasons and required-level rejection metadata.

### TDD RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.Phase2Tests.test_sibling_alternate_requires_paired_item_and_required_level_evidence Tests.test_targeted_content.Phase2Tests.test_sibling_profile_cluster_uses_profile_band_width_limit Tests.test_targeted_content.Phase2Tests.test_sibling_recompute_preserves_rejection_metadata -v
```

Exact output:

```text
test_sibling_alternate_requires_paired_item_and_required_level_evidence (Tests.test_targeted_content.Phase2Tests.test_sibling_alternate_requires_paired_item_and_required_level_evidence) ... FAIL
test_sibling_profile_cluster_uses_profile_band_width_limit (Tests.test_targeted_content.Phase2Tests.test_sibling_profile_cluster_uses_profile_band_width_limit) ... FAIL
test_sibling_recompute_preserves_rejection_metadata (Tests.test_targeted_content.Phase2Tests.test_sibling_recompute_preserves_rejection_metadata) ... FAIL

----------------------------------------------------------------------
Ran 3 tests in 0.002s

FAILED (failures=3)
```

### Focused verification

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact output:

```text
Ran 32 tests in 0.009s

OK
```

### Full suite

Command:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
```

Exact output:

```text
...........................................................................................
..........................
----------------------------------------------------------------------
Ran 117 tests in 49.322s

OK
```

### Final verification after the null-safe helper adjustment

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact result:

```text
Ran 32 tests in 0.022s

OK
```

Command:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
```

Exact result:

```text
Ran 117 tests in 74.414s

OK
```

### Additional checks

Command:

```text
rtk py -m py_compile generate_pack.py Tests/test_targeted_content.py
```

Exact output:

```text

```

## Round 3 fix report

### Scope

Sibling-adjusted encounter evidence that exceeds the existing boss width limit now invalidates its profile before aggregate re-merge can hide the invalidity. Mixed raid width-26 rejection, aggregate/profile width behavior, paired ItemLevel/RequiredLevel evidence, rejection metadata, and prior Task 2/3 behavior are unchanged.

### TDD RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.Phase2Tests.test_width_21_sibling_boss_evidence_invalidates_profile -v
```

Exact output:

```text
test_width_21_sibling_boss_evidence_invalidates_profile (Tests.test_targeted_content.Phase2Tests.test_width_21_sibling_boss_evidence_invalidates_profile) ... FAIL

----------------------------------------------------------------------
Ran 1 test in 0.001s

FAILED (failures=1)
```

### Covering verification

Command:

```text
rtk py -m unittest Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.Phase2Tests Tests.test_targeted_content.SafetyTests -v
```

Exact result:

```text
Ran 34 tests in 0.012s

OK
```

### Full suite

Command:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
```

Exact result:

```text
Ran 119 tests in 59.637s

OK
```

### Additional checks

Command:

```text
rtk py -m py_compile generate_pack.py Tests/test_targeted_content.py
```

Exact output:

```text

```

Command:

```text
rtk git diff --check
```

Exact output:

```text

```
