# Dungeon / Raid Loot Insertion Rework

**Date:** 2026-09-09  
**Status:** Approved design; implementation pending  
**Repository:** `WotLKItemGenerator`

## Goal

Make default dungeon and raid placement conservative, progression-aware, difficulty-aware, deterministic, and explainable from the supplied AzerothCore/WotLK sources. Generated items that cannot be safely justified remain world-only.

The existing item generator remains the owner of item IDs, names, stats, effects, sockets, appearances, disenchanting, DBC output, and seed behavior. Encounter work adds placement metadata and optional SQL attachments only.

## Baseline and failure being corrected

The supplied seed `2229264932` pack currently reports 52 encounter profiles, 258 generated encounter pools, 1,011 attachments, and 94,144 placed items. Its 5,887 RequiredLevel 80 items and all ItemLevel 200+ placements are assigned to dungeons, concentrated in Nexus and Culling of Stratholme. The current implementation derives broad bands from creature level envelopes, copies them across difficulties and encounters, requires static creature spawn membership for bosses, and chooses profiles using ItemLevel alone.

The source snapshot contains 135 maps, 187 map difficulties, 30,206 creature templates, 17,704 spawned creature IDs, and 628 instance encounters. The reference pack and `2229264932/` directory are evidence only and must not be modified.

## Scope and non-goals

In scope:

- source-backed map+difficulty discovery for default encounter integration;
- stock loot evidence, reference filtering, ItemLevel and RequiredLevel bands;
- difficulty-specific quality and LootMode eligibility;
- deterministic profile, encounter, and generated-set placement;
- creature, reference, and optional gameobject loot targets;
- validation, coverage, rejection, comparison, placement, and set audits;
- fail-closed encounter SQL/import behavior;
- regression tests and contract documentation.

Out of scope:

- changes to item generation or progression curves;
- live database writes or live-world balancing;
- invented map, boss, gameobject, item, or loot IDs;
- replacement of existing stock loot rows;
- a new dependency or a separate encounter framework/module.

## Design decisions

1. Keep the current single-file pipeline and dict-based records. Reuse `h64`, `weighted`, SQL table parsing, manifest resolution, loot rendering, and cleanup conventions instead of introducing parallel classes or a new subsystem package.
2. Default source-backed profiles use inferred evidence. Explicit content-manifest profiles remain authoritative for their explicit encounter order, targets, and ranges; profiles with map/difficulty metadata receive the same source membership and safety checks.
3. Gameobject support is optional at runtime because the checked-in `Data/` snapshot has no gameobject source files. If all explicitly configured gameobject sources are present, verifiable gameobject targets are supported. If they are absent, the relevant candidate is recorded as excluded; no boss-to-chest mapping is guessed.
4. `DungeonMap.dbc` is used only for source context and for resolving a verifiable `lastEncounterDungeon` relationship. Its membership is never a general prerequisite for discovering raid profiles.
5. Encounter validation is independent of core item validation. A failed optional encounter integration does not discard valid item SQL or world-loot output.

## Existing pipeline integration

The implementation keeps this flow:

```text
build_skeletons -> finish_items -> validate items
                                  -> infer/assign encounter placement
                                  -> validate encounter integration
                                  -> write item, world-loot, encounter, and audit outputs
```

Encounter placement runs after item finalization so it can use the generated `RequiredLevel`, `ItemLevel`, `Quality`, set, role, and slot metadata without changing those values.

## Source catalog and profile discovery

Extend the existing encounter source catalog with:

- map rows and every valid `(map_id, difficulty_id)` pair from `Map.dbc` and `MapDifficulty.dbc`;
- map type, instance type, max players, difficulty label, and LootMode bit;
- creature templates, static creature map membership, and creature loot rows;
- instance encounter rows, including `creditType`, `creditEntry`, and `lastEncounterDungeon`;
- reference loot rows and their consumer contexts;
- item-template metadata needed to classify stock equipment;
- optional gameobject templates, static map membership, and gameobject loot rows.

Candidate profiles are all instance maps with map type dungeon or raid and a valid `MapDifficulty.dbc` row. Every candidate is represented in `encounter_profile_coverage.csv`, including excluded candidates and a concrete `excluded_reason`.

`instance_encounters` is authoritative evidence that a boss encounter exists. Creature bosses do not require a normal static spawn when a valid creature template, loot relationship, and map relationship are proven through available source data. A `lastEncounterDungeon` to `DungeonMap.dbc` mapping may provide that map relationship for scripted encounters. Static spawns remain the primary trash and location source. Gameobject credits use the same rule with the optional gameobject sources.

For each profile, the catalog creates distinct ordered target records for trash, each boss, and any verifiable gameobject reward target. A target record contains its table type, entry, creature or gameobject identity, encounter rank, and source evidence. A profile with no usable target is excluded rather than silently omitted.

Difficulty labels are derived from map type, difficulty ID, and DBC player-count metadata. No global `0 = normal, 1 = heroic` assumption is used. LootMode remains `1 << difficulty_id`, with a bounded bit range suitable for the source schema.

## Stock loot evidence and band inference

Load stock `item_template` metadata once for encounter analysis. A stock reference is eligible only when it represents meaningful equippable equipment: valid weapon or armor class/subclass/inventory data, useful quality, and positive ItemLevel. Quest objects, keys, currencies, consumables, recipes, profession materials, mounts, pets, non-equipment tokens, and utility rows are excluded.

For each creature or gameobject target and difficulty:

1. Apply the source LootMode bitmask to the parent loot row and the resolved referenced rows.
2. Prefer direct equipment rows.
3. Resolve reference equipment only when the reference group is demonstrably profile-specific. A reference consumed by unrelated maps is excluded from band evidence and listed in `encounter_band_rejections.csv`.
4. Calculate encounter-specific evidence first, then profile/map+difficulty evidence, then a safe same-map fallback. No raw global minimum/maximum is used.
5. Use a deterministic robust cluster rule over sorted discrete ItemLevels: split large gaps, retain the dominant cluster for fallback evidence, and retain multiple clusters only when direct target evidence independently justifies them. Sparse evidence is kept only when it is not contradicted by a broader contaminated source.
6. Derive RequiredLevel ranges from retained stock equipment and, when needed, bounded creature level context. There is no `1..80` default fallback. Empty or unsafe RequiredLevel evidence excludes the profile from generated placement.

Each band records its method (`direct`, `encounter_reference`, `profile_aggregate`, or `nearby_fallback`), source item counts, retained values, rejected values, quality evidence, and center. Direct boss evidence takes precedence over generic rank interpolation.

Band validation uses the requested safety thresholds: warnings above 20 for boss bands, 25 for trash bands, and 30 for aggregate fallback bands. A broad band is invalid when its source evidence cannot justify it. Direct evidence may explain a wider raid progression range, but it remains visible as a warning.

## Placement

An ordinary generated item is eligible only if all of the following hold:

- the profile and target are valid;
- ItemLevel fits the target/profile safe band;
- RequiredLevel fits the target/profile RequiredLevel range;
- quality is supported by the target's stock quality evidence;
- the target has a valid loot table and source relationship.

If no profile qualifies, the item keeps its world-loot placement and receives no encounter metadata.

Eligible profiles and targets are ranked by stable tuples in this order:

1. exact ItemLevel and RequiredLevel containment/margin;
2. distance from the evidence band center;
3. RequiredLevel distance from the evidence center;
4. source confidence, preferring direct evidence over fallbacks;
5. source-derived content tier and dungeon/raid appropriateness;
6. boss/trash and encounter rank rules;
7. BLAKE2b tie-break using the existing seed, item entry, profile, difficulty, target, and placement stage.

The algorithm never uses Python `hash()`, random iteration order, or map names as special cases. Legendary items cannot use trash. Epic trash placement requires matching stock epic trash evidence. High-value items prefer bosses; lower-quality items may use trash only when source evidence supports them.

## Atomic generated sets

Before ordinary item assignment, group generated set pieces by their existing set ID. A set is assigned to one shared eligible map+difficulty only when every piece satisfies that profile's ItemLevel, RequiredLevel, quality, and source rules. If no common profile exists, all pieces remain world-only.

Inside the selected profile, pieces are assigned deterministically to distinct bosses where possible using slot progression (hands earlier, shoulders/chest middle, head/legs later). If fewer than five bosses exist, every boss is used before reuse; repeated pieces prefer later bosses. Trash is never used solely to manufacture unique destinations.

`set_manifest.csv` records one atomic profile decision and every piece-to-encounter assignment. Validation rejects any split set or independently assigned piece.

## Gameobject loot

Add optional CLI/source handling for `gameobject.sql`, `gameobject_template.sql`, and `gameobject_loot_template.sql`. The target abstraction accepts `creature`, `gameobject`, and `reference` types. SQL rendering maps each type to its correct table, and cleanup/collision checks include generated gameobject attachments. Missing optional sources produce coverage exclusions, not guessed mappings.

## Safety gate and outputs

Build an encounter validation report before emitting encounter SQL. It records:

- `encounter_integration_enabled`;
- `encounter_integration_valid`;
- `encounter_validation_errors`;
- `encounter_validation_warnings`;
- coverage, profile, difficulty, placement, set, and endgame summaries.

Encounter validation checks unique profile/pool IDs, valid maps/difficulties/targets, safe ItemLevel and RequiredLevel bands, LootMode, source counts, quality rules, placement references, set atomicity, duplicate unrelated assignments, and generic high-end destination sanity. If valid WotLK raid profiles exist and eligible level-80/high-ilvl items collapse into leveling dungeons with no raid placements, validation fails.

Diagnostics are always written. When encounter validation fails, `IMPORT_ORDER.txt` contains no encounter SQL or encounter cleanup file, and no importable `dungeon_raid_encounter_loot.sql` is emitted. Item SQL, world-loot SQL, ordinary cleanup, placement headers, and `validation_report.json` still emit. The encounter subsystem therefore fails closed without failing the core pack.

The following reports are added or expanded:

- `encounter_profile_coverage.csv` — every candidate map+difficulty and exclusion reason;
- `encounter_profiles.csv` — evidence, bands, targets, validity, and source counts;
- `difficulty_band_comparison.csv` — independent difficulty bands and identical-band reasons;
- `encounter_band_rejections.csv` — rejected stock items and references with reasons;
- `set_manifest.csv` — atomic set placement decisions;
- `dungeon_raid_item_placements.csv` — required-level bounds, band source/count/center, score, reason, set metadata, and target details;
- existing `encounter_loot.csv` and JSON report — expanded with the same evidence and validation status.

Generated encounter pool IDs remain in the reserved encounter range and are checked against every supplied reference entry. Cleanup removes only generated pools and generated creature/reference/gameobject attachment rows.

## Manifest compatibility

Manifest profiles without source map/difficulty metadata retain their existing explicit behavior and tests. Manifest profiles with source metadata use the source target validator and the new target-type/loot checks. Default generation uses the inferred source-backed profile catalog and does not require a manifest.

## Files

Expected implementation files:

- `generate_pack.py` — source catalog, inference, placement, validation, output gating, gameobject targets, and reports;
- `Tests/test_targeted_content.py` — focused regression fixtures and deterministic output tests;
- `Architecture.md` — updated encounter contract and report/import behavior.

No source data, generated reference pack, server database, or unrelated dirty file is modified.

## Regression and acceptance tests

Add tests for outlier rejection, shared-reference contamination, independent normal/heroic bands and LootMode, RequiredLevel rejection, no forced placement, boss/trash quality safety, set atomicity and insufficient shared profiles, scripted boss discovery, gameobject SQL, raid difficulty discovery, safety gating, and byte-identical deterministic reports/SQL.

After implementation, run the existing suite plus the focused encounter tests, a small deterministic generation smoke, and a fresh seed `2229264932` run. Acceptance requires no Nexus/Culling-style contaminated bands, no level-80 placement collapse into leveling dungeons when valid raid evidence exists, independent difficulty bands, atomic sets, fail-closed invalid encounter output, and clean existing item validation.
