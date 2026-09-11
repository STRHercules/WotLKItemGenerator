# Phase 3 final fix-wave report

Date: 2026-09-11  
Worktree: `codex/phase3-encounter-loot`  
Base: `b97515e658691783ac6cae3e828dae92d1828b9f`

## Scope

Applied the final review fixes only:

- made scripted reward completion detection path/depth aware while preserving the reviewed later-difficulty form and existing nested-control rejection;
- kept `Data/` as the default gameobject source directory when an AzerothCore source root is supplied for script scanning;
- exposed optional gameobject source status, candidate paths, and missing paths without disabling core generation;
- kept script evidence without an explicit map audit-only when a gameobject entry is spawned on multiple maps;
- strengthened the gameobject cleanup SQL regression and removed the duplicated generated-README fail-closed bullet;
- removed the three accidentally tracked task scratch reports.

No dependencies, modules, IDs, database writes, Data files, or generated packs were added or changed.

## TDD evidence

### RED

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests.test_nested_unrelated_guard_does_not_inherit_done_set_boss_state Tests.test_targeted_content.SourceTests.test_unmapped_script_reward_on_reused_entry_stays_audit_only Tests.test_targeted_content.RuntimeTests.test_source_root_does_not_replace_data_gameobject_defaults Tests.test_targeted_content.RuntimeTests.test_missing_optional_gameobject_sources_report_paths_without_abort -v
```

Observed result before the final fixes:

```text
test_nested_unrelated_guard_does_not_inherit_done_set_boss_state ... FAIL
test_unmapped_script_reward_on_reused_entry_stays_audit_only ... FAIL
test_source_root_does_not_replace_data_gameobject_defaults ... FAIL
test_missing_optional_gameobject_sources_report_paths_without_abort ... ERROR
----------------------------------------------------------------------
Ran 4 tests in 152.949s

FAILED (failures=3, errors=1)
```

The failures covered the broad `SetBossState(..., DONE)` fallback, source-root/Data coupling, and reused-entry promotion; the error was the missing optional-source diagnostic contract.

### GREEN: focused final-fix behavior

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests.test_nested_unrelated_guard_does_not_inherit_done_set_boss_state Tests.test_targeted_content.SourceTests.test_done_path_survives_unrelated_later_difficulty_if Tests.test_targeted_content.SourceTests.test_nested_control_block_does_not_inherit_outer_done_condition Tests.test_targeted_content.SourceTests.test_braced_done_control_block_reports_real_function Tests.test_targeted_content.SourceTests.test_explicit_done_path_summon_maps_script_reward Tests.test_targeted_content.SourceTests.test_unmapped_script_reward_on_reused_entry_stays_audit_only -v
```

Observed result:

```text
----------------------------------------------------------------------
Ran 6 tests in 0.030s

OK
```

### GREEN: relevant encounter suites

Command:

```text
rtk py -m unittest Tests.test_targeted_content.SourceTests Tests.test_targeted_content.ProfileTests Tests.test_targeted_content.ReportTests Tests.test_targeted_content.LootTests Tests.test_targeted_content.SafetyTests -q
```

Observed result:

```text
----------------------------------------------------------------------
Ran 58 tests in 19.471s

OK
```

The runtime source-root and missing-source tests were observed passing in the boundary run after their implementation; the scanner’s pre-existing nested-control negative was then corrected and the six-test scanner regression set was rerun green above.

Per the final instruction to stop verification, no additional test or static-check command was run after this report was prepared.
