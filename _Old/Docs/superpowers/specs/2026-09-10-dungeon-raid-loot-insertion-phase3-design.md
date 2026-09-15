# Dungeon / Raid Loot Insertion Rework — Phase 3

**Date:** 2026-09-10  
**Status:** Design for review  
**Repository:** `WotLKItemGenerator`

## Goal

Extend the existing source-backed encounter placement pipeline so Phase 3:

1. distributes generated loot across genuinely equivalent safe profiles;
2. resolves active progression eras coherently across sibling difficulties;
3. accepts shared reference loot only when a verified difficulty-specific parent proves its context; and
4. uses optional static and scripted gameobject reward evidence without guessing boss relationships.

The existing item generator, safe filters, atomic set behavior, SQL namespace, and fail-closed encounter boundary remain authoritative.

## Current repository state

`generate_pack.py` already contains the single-file encounter pipeline, source SQL table parser, difficulty-specific creature-template resolution, basic gameobject loading, gameobject SQL rendering, placement metadata, and encounter validation. The remaining gaps are:

- the three gameobject sources are accepted only through explicit CLI paths and are not auto-discovered from `Data/`;
- gameobject loading retains too little spawn/template provenance for a reward audit;
- reference traversal rejects a shared reference based mainly on map-wide consumers instead of verified parent context;
- default profile inference chooses the largest progression cluster independently for each sibling difficulty;
- profile selection takes the single lowest score, so equivalent candidates collapse onto one destination;
- distribution, reference-provenance, and gameobject-reward reports are missing;
- collision and rollback SQL lacks a first-class gameobject path in its main generation flow.

The supplied `Data/` snapshot contains all three optional gameobject files. They remain ignored source inputs, not generated or staged project files. No AzerothCore source root is assumed to exist; scripted mapping is therefore `not_exercised` unless the user supplies one.

## Non-goals

- No rewrite of item generation, progression curves, IDs, names, stats, effects, sockets, appearances, disenchanting, or DBC generation.
- No new dependency, package, encounter framework, or database client.
- No live database writes or live-world balancing.
- No invented map, encounter, gameobject, item, loot, or progression IDs.
- No destructive rewrite of stock loot rows.
- No fuzzy association based only on a shared map, filename, symbol, or source-file proximity.
- No unrelated naming, set coverage, healer/Hunter coverage, socket, disenchant, or item-balance work.

## Architecture

Keep the current dict-based records and pipeline:

```text
load source catalog
    -> build independent map+difficulty profiles
    -> apply sibling progression coherence
    -> finalize generated items
    -> stage-A hard eligibility
    -> stage-B deterministic equivalent-profile distribution
    -> build encounter pools and attachments
    -> validate profiles, provenance, distribution, and SQL safety
    -> write reports always; write encounter SQL/import entries only when valid
```

The implementation stays in `generate_pack.py`. Existing helpers such as `_load_sql_table_rows`, `_stock_item_metadata`, `h64`, `resolve_encounter_order`, and the current SQL/report writers are extended or reused. No parallel abstraction is introduced.

## Source discovery and catalog contract

Add default paths for:

```text
Data/gameobject.sql
Data/gameobject_template.sql
Data/gameobject_loot_template.sql
```

Runtime behavior:

- If all three defaults exist, the normal source-backed run loads them automatically.
- Explicit `--gameobject-source`, `--gameobject-template-source`, and `--gameobject-loot-source` override the defaults and must still be supplied together.
- A partial explicit trio fails with a clear argument error.
- A missing or incomplete optional default trio leaves gameobject support `not_exercised`; it does not disable core item/world-loot generation.
- Add `--azerothcore-source-root` as an optional source-code root. Its absence sets `script_reward_mapping = not_exercised`.

The catalog retains:

```python
{
    'gameobject_templates': {
        entry: {
            'entry': int,
            'type': int,
            'name': str,
            'lootid': int,       # gameobject_template.Data1, never entry
        },
    },
    'gameobject_spawns': [
        {
            'guid': int,
            'entry': int,
            'map_id': int,
            'spawn_mask': int,
        },
    ],
    'gameobject_maps': {entry: set[int]},
    'gameobject_loot_rows': list[tuple],
    'gameobject_loot_entries': set[int],
}
```

Only WotLK chest-like gameobjects (`type = 3`) with a positive `Data1` loot ID are eligible for reward-object analysis. Their loot rows use the same LootMode, equipment, RequiredLevel, ItemLevel, quality, outlier, and reference rules as creature loot.

## Static and scripted gameobject evidence

Static discovery resolves every spawn through:

```text
gameobject.id
    -> gameobject_template.entry
    -> gameobject_template.Data1
    -> gameobject_loot_template.Entry
```

A static spawn proves map membership and spawn mask only. It does not prove a boss relationship. A gameobject becomes a valid encounter target only when one of these strong relationships exists:

- `instance_encounters.creditType = gameobject` identifies the entry and its map/difficulty context;
- an explicit manifest target is source-validated; or
- a script source provides an explicit reward action for that encounter.

The optional source-code scanner walks `src/server/scripts/` below the supplied root and records only strong relationships where an encounter-completion path explicitly passes a gameobject entry or constant to `SummonGameObject` or an equivalent reward action. Same-file symbol co-occurrence is never sufficient. Every accepted relationship records script path, encounter identity, gameobject entry, difficulty condition when present, and evidence type.

Static and scripted results are represented in `gameobject_reward_targets.csv`. Invalid map-associated chests remain visible in the audit with an `invalid_reason`; they never receive generated attachments.

## Reference provenance and safe shared references

Reference traversal becomes context-aware without weakening contamination protection.

For every reference edge, retain:

```python
{
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
    'verified_parent': bool,
}
```

A shared reference is eligible for progression inference only when all of the following are true:

1. the profile is source-valid;
2. the effective creature or gameobject target is proven for that map and difficulty;
3. the parent loot row is reached through the target's verified loot ID;
4. the reference row's LootMode applies to the same difficulty context; and
5. normal equipment, ItemLevel, RequiredLevel, quality, cluster, and width filters retain the resulting stock item.

An unresolved reference or a reference reached by an unverified generic parent remains excluded and is reported. A verified difficulty-specific parent can accept a reference even when the same reference ID is consumed elsewhere; the provenance report makes that exception explicit.

## Independent progression inference and sibling coherence

Each map+difficulty first calculates its own target evidence and progression clusters. The independent result retains candidate clusters, not only the winning cluster, including:

- ItemLevel values and width;
- RequiredLevel values and width;
- retained/rejected counts;
- source and target identity;
- stock quality counts, dominant quality, and Epic ratio.

After independent inference, profiles on the same map are compared only when they share an active encounter family or otherwise have source-backed sibling identity. A sibling can support an alternate cluster when that cluster is coherent rather than a one-row outlier:

- at least three retained source items;
- a bounded cluster width under the existing safe threshold; and
- consistent ItemLevel/RequiredLevel progression evidence from the sibling family.

Sibling support increases the candidate cluster confidence; it does not blindly choose the highest cluster. A low-level map with one unrelated level-80 row therefore keeps its low-level cluster.

The chosen profile evidence records the supporting sibling profile IDs and reason. If sibling profiles for one active encounter family resolve to materially different eras without an explainable source distinction, the manifest records `sibling_progression_era_conflict`. Encounter validation treats that unresolved conflict as unsafe for SQL integration while still emitting core item/world output and all diagnostics.

## Eligibility and equivalent-profile distribution

Placement remains two-stage.

### Stage A: hard eligibility

For each generated item, retain only profiles and encounters that pass the existing safety rules:

- valid profile and source target;
- ItemLevel inside the target's safe band;
- RequiredLevel inside the target/profile range;
- quality supported by retained stock evidence;
- Legendary never on trash;
- Epic trash only when stock Epic trash evidence exists;
- no mixed or unsafe progression cluster;
- generated sets require one common profile for all members.

No profile is added solely for variety.

### Stage B: deterministic distribution

Eligible candidates are grouped only when their source-backed progression is equivalent for the item. The group requires compatible ItemLevel and RequiredLevel fit, bounded band width, compatible progression cluster, and no hard safety difference. Soft signals include:

- distance from evidence centers;
- direct versus reference versus aggregate evidence;
- quality compatibility from the profile's retained quality counts;
- boss versus trash and encounter rank;
- source-derived progression fit.

Quality is a soft preference, not a dungeon/raid rule. A generated Rare prefers a compatible profile whose stock evidence is Rare-heavy; a generated Epic can prefer an Epic-heavy profile. The profile evidence remains authoritative.

Use bounded weights so a soft preference cannot eliminate an otherwise equivalent candidate. Select with a per-item rendezvous score derived from the existing BLAKE2b helper:

```text
hash_fraction = h64(seed, stable_item_or_set_key,
                    equivalence_group, profile_id, distribution_tag) / 2**64
distribution_score = hash_fraction * bounded_profile_weight
```

The maximum score wins, with stable profile ID as the final tie-break. No mutable counters, input order, Python `hash()`, or random iteration order participates. Reversing generated-item order produces the same entry-to-profile mapping.

Generated sets use the set ID as the stable distribution key, choose one common profile, and retain the existing deterministic slot-to-boss assignment. If there is no common safe profile, every member remains world-only.

Placement metadata gains the equivalence group, distribution weight, and distribution score used for audits. Existing placement score remains available for diagnostics.

## Distribution audit and safety gate

Write `encounter_distribution_audit.csv` with stable columns:

```text
equivalence_group,RequiredLevel,ItemLevel,quality,
eligible_profile_count,items_placed,dominant_profile,
dominant_profile_share,distribution_entropy,warning
```

Use Shannon entropy over assigned profile counts. Emit a warning for three or more equivalent profiles, at least 100 items, and a dominant share above 80%. Emit a validation error for five or more equivalent profiles, at least 250 items, and a dominant share above 95%. Unique or materially distinct profile groups are not penalized.

The audit is built from final placements and is checked before encounter SQL is emitted. A deliberately collapsed selector therefore fails the encounter integration safety gate.

## Reports and SQL safety

Always emit diagnostic report headers, even when encounter integration is invalid:

- `encounter_distribution_audit.csv` — equivalent groups and concentration;
- `encounter_reference_provenance.csv` — every reference edge and verification context;
- `gameobject_reward_targets.csv` — static/scripted reward-object evidence and validity;
- existing coverage, profile, difficulty, rejection, placement, set, and encounter reports with the new evidence fields.

All report rows are sorted by stable IDs and use fixed field order.

Encounter SQL remains additive. Target types map only to their correct tables:

```text
creature   -> creature_loot_template
reference  -> reference_loot_template
gameobject -> gameobject_loot_template
```

Update collision checks, cleanup, rollback, and schema checks to include gameobject attachments and all generated encounter pool IDs. Deletes remain restricted to generator-owned pool IDs or exact generated attachment predicates. Stock reward rows are never broadly deleted or rewritten.

If encounter validation raises any error, clear encounter metadata from generated items, omit encounter SQL and encounter cleanup from `sql/IMPORT_ORDER.txt`, and continue writing item SQL, world-loot SQL, reports, and `validation_report.json`.

## CLI and runtime status

The source audit and generated validation report expose:

```text
gameobject.sql                  FOUND / not configured
gameobject_template.sql         FOUND / not configured
gameobject_loot_template.sql    FOUND / not configured
script reward mapping           EXERCISED / not_exercised
```

The optional gameobject trio is included in source checks only when the complete set is available or explicitly configured. Missing optional sources are not a false encounter failure; missing evidence can exclude only the affected reward targets.

## Files to modify

- `generate_pack.py`
  - default source discovery and CLI/runtime wiring;
  - gameobject spawn/template/loot catalog and script evidence;
  - reference provenance and verified-parent traversal;
  - sibling progression pass and conflict audit;
  - equivalent-profile distribution and concentration audit;
  - validation, report writers, collision/cleanup/schema SQL, and generated README text.
- `Tests/test_targeted_content.py`
  - regression fixtures for distribution, sibling coherence, reference provenance, static/scripted gameobjects, reports, and safety gating.
- `Architecture.md`
  - source, placement, report, and import contracts.

Do not modify or stage the user-supplied ignored `Data/*.sql` files, generated seed outputs, or unrelated work.

## Test and acceptance strategy

Use the existing `unittest` suite and add focused tests before production changes. Required cases:

- equivalent profiles receive more than one destination and remain deterministic;
- iteration order does not change entry-to-profile mapping;
- stock-quality evidence affects preference without a hardcoded dungeon/raid quality rule;
- sibling modern cluster wins over a larger legacy cluster only when coherent;
- one high-level outlier does not replace a coherent low-level cluster;
- unresolved shared references are rejected;
- verified difficulty-specific shared references are accepted with provenance;
- static chest resolution uses `Data1`, map, spawn mask, and loot entry correctly;
- explicit script summon maps a reward object, while same-file symbol co-occurrence does not;
- distribution concentration fails validation at the requested thresholds;
- gameobject SQL, cleanup, collision checks, and report headers are correct;
- invalid encounter integration preserves item/world output and omits encounter import entries.

After focused tests pass:

```text
rtk py -m unittest discover -s Tests -p "test_*.py"
rtk git diff --check
rtk py .\generate_pack.py --number 100 --seed 2070213938 --ui plain
rtk py .\generate_pack.py --seed 2070213938 --ui plain
```

The full run must preserve 100,000 unique items/names, clean core validation, atomic sets, safe RequiredLevel/ItemLevel placement, no Legendary trash, deterministic reports, and encounter SQL only when the complete encounter validation is valid. Live server/client behavior remains outside this static/source-backed acceptance boundary.
