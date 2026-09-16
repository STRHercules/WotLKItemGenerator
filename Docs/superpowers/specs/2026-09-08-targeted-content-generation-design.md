# Targeted Content Generation Design

## Goal

Extend the WotLK item generator so one deterministic generation request can produce disjoint item quotas constrained by required level, item level, quality, class, weapon, and set rules, then attach those generated items additively to explicitly mapped dungeon/raid encounters and quest rewards.

## Approved decisions

- The mapping input is explicit and authoritative; names are labels, IDs are targets.
- Required level and item level are independent constraints.
- Mixed recipe counts are disjoint by default.
- Sets count as complete sets and expand to their configured piece count.
- Fixed and choice quest rewards are supported.
- Existing quest rewards are preserved; empty slots are filled by default.
- Normal, Heroic, 10-player, and 25-player content use separate profiles.
- Dungeon/raid boss order is represented with explicit prerequisite relationships.
- Item level increases through the instance; the final boss receives the profile maximum.
- Loot allocation is weighted, with bosses weighted above trash and the final boss optionally highest.
- Generated loot is additive and never competes with existing loot rows.
- Generated loot has a configurable additional-drop chance at profile and encounter level.
- One generated item is awarded per successful additional roll by default; encounter quantity can override it.
- The generator remains offline and writes inspectable SQL/DBC/report files; it does not connect to a live database.

## Approach

Keep the existing skeleton -> finalization -> validation -> output pipeline. Add a standard-library JSON manifest parser and a planning layer that assigns every generated item to one recipe and, when requested, to one encounter or quest target before output is written. Preserve the existing no-manifest behavior as the compatibility path.

The same finalized item records feed the existing item SQL/DBC writers and new output adapters. Loot and quest adapters only append generated rows or fill empty reward fields; they do not rewrite unrelated source rows.

## Manifest model

The manifest contains four top-level sections:

### Profiles

Each profile has a stable ID and defaults for:

- required-level minimum and maximum
- item-level minimum and maximum
- quality constraints or weights
- optional class, role, slot, weapon, and set constraints
- item-level progression behavior
- additional-drop chance and default quantity

Named profiles such as `naxx_25` are data, not hard-coded branches. Explicit recipe values override profile defaults.

### Recipes

Each recipe specifies:

- exact count
- optional profile ID
- required-level range
- item-level range
- quality
- class/role/slot/weapon constraints
- set count and set size
- target kind: general, dungeon/raid, or quest
- whether overlap is explicitly enabled

The planner reserves disjoint quotas before generation. It fails before output if a recipe cannot be satisfied or if set expansion exceeds the requested total.

### Dungeon and raid profiles

Each difficulty-specific profile specifies:

- stable profile ID and display name
- item-level floor and maximum
- ordered encounter graph
- trash groups and their exact creature/reference loot targets
- boss nodes and their exact creature/reference loot targets
- encounter weights
- optional per-encounter item-level range, chance, and quantity override

Each boss node has a stable ID, display name, prerequisite boss IDs, and target IDs. The resolver performs a deterministic topological sort, assigns progression ranks, rejects duplicate targets and cycles, and reports the resolved order. Branches may share a rank. A linear item-level curve is the fallback; explicit per-encounter ranges win.

Trash groups are assigned to a progression rank and receive their own generated pool. Bosses receive separate pools. The final boss's upper bound is the profile maximum unless explicitly overridden.

### Quest targets

Each quest target specifies:

- quest ID
- fixed reward or choice reward mode
- preferred empty slot(s)
- recipe/profile source
- optional quantity override
- explicit overwrite opt-in, default false

The source `quest_template` SQL must be supplied for validation. Missing quests, invalid slots, occupied default slots, and duplicate assignments fail before output unless the manifest explicitly permits the behavior.

## Output behavior

### Dungeon/raid loot

Create one generated reference pool per encounter. Add one independent reference attachment to each mapped creature/reference target with the configured additional-drop chance, quantity, loot mode, and comment. Existing loot rows, group IDs, chances, and quantities remain unchanged. Cleanup SQL removes only generated pool rows and generated attachment rows.

### Quest rewards

Emit targeted SQL updates for empty fixed and choice reward slots. Existing reward values remain unchanged unless an explicit overwrite flag is set. Cleanup SQL restores only fields changed by this generation, using the generated manifest/report as the source of truth.

### Reports

Extend the machine-readable report with:

- recipe counts requested, planned, and emitted
- profile/range constraints
- resolved dungeon/raid encounter order and ranks
- per-encounter item counts, weights, chances, and quantities
- quest assignments and preserved/filled slots
- generated pool and attachment IDs
- validation errors and source audit information

## Validation

Before any SQL or DBC output:

- every recipe count is exact and disjoint unless overlap is explicit
- every item satisfies both independent level constraints
- set members are cohesive and count toward one recipe
- every mapped loot target exists in the supplied source SQL
- every encounter graph is complete and acyclic
- every generated pool/attachment ID is collision-free
- no existing quest reward is overwritten by default
- every generated item is assigned to the intended encounter or quest target exactly once
- additional-drop quantity and chance values are valid

## Compatibility and non-goals

- Existing no-manifest generation remains unchanged.
- Existing world-loot bracket output remains available as its own mode.
- No automatic boss discovery from creature names, SQL row order, or creature IDs.
- No live database writes.
- No new third-party dependency.
