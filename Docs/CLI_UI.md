# WotLK Item Generator — Live CLI UI

The generator now includes a Rich setup wizard and presentation-only terminal dashboard. The dashboard does not participate in item randomization, hashing, naming, stat selection, effects, sets, loot, SQL, or DBC generation; the setup wizard selects the run's item count and loot destinations.

## Display modes

```powershell
py .\generate_pack.py                  # Rich setup wizard, then the fancy dashboard
py .\generate_pack.py --ui fancy       # explicitly request the Rich dashboard
py .\generate_pack.py --ui plain       # low-noise standard-library progress output
py .\generate_pack.py --no-animations  # styled dashboard without the opening splash or animated spinners
py .\generate_pack.py --show-items     # expand the discovery feed with additional Epic items
py .\generate_pack.py --quiet          # errors + one final completion line only
```

## Rich dependency

Bare invocation uses Rich for the setup wizard. Explicit `--ui plain` runs still work without third-party packages. For Rich:

```powershell
py -m pip install rich
```

If Rich is unavailable, use an explicit CLI run with `--ui plain`.

## What the live dashboard shows

- a short opening splash: a slowly rotating shaded globe, drifting motes, and a progress bar whose accent color rolls through the item-rarity palette (about two seconds; skipped by `--no-animations`, `--ui plain`, and `--quiet`)
- the setup wizard's required `Data/` DBC/SQL file list, remembered AzerothCore path, item count, loot destination choices, and final confirmation on a bare run
- cached source mappings on later runs; DBC/SQL/source changes automatically trigger a rebuild
- the same globe keeps rotating inside the `Current Work` panel while the startup phases run (starting the forge, inspecting sources, harvesting stock data); it disappears once item generation begins
- source SQL/DBC checks
- seed, item count, selected classes, enabled features, and output path
- selected world, dungeon, and/or raid loot insertion destinations
- targeted manifest encounter/quest assignment mode when `--content-manifest` is used
- true overall progress through skeleton generation and item finalization
- per-class progress bars
- current class, level, quality, and item name
- generated Legendary callouts
- complete generated set callouts
- proc, On Use, and Equip-effect discoveries
- validation progress and result
- output-writing progress for loot pools, encounter/quest SQL, Item.dbc, ItemSet.dbc, manifests, checksums, and README
- explicit world and dungeon/raid placement counts
- per-item world and dungeon/raid placement CSV reports
- final quality and feature counts plus elapsed time

The live discovery panel is bounded, so long runs do not flood the terminal. Plain/redirected output stays intentionally quieter; `--show-items` expands it when desired.
