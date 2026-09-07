# WotLK Item Generator — Live CLI UI

The generator now includes a presentation-only terminal dashboard. The UI does not participate in item randomization, hashing, naming, stat selection, effects, sets, loot, SQL, or DBC generation.

## Display modes

```powershell
py .\generate_pack.py                  # auto: fancy in an interactive terminal when Rich is installed
py .\generate_pack.py --ui fancy       # explicitly request the Rich dashboard
py .\generate_pack.py --ui plain       # low-noise standard-library progress output
py .\generate_pack.py --no-animations  # styled dashboard without animated spinners
py .\generate_pack.py --show-items     # expand the discovery feed with additional Epic items
py .\generate_pack.py --quiet          # errors + one final completion line only
```

## Optional Rich dependency

The generator still runs without third-party packages. For the full live dashboard:

```powershell
py -m pip install rich
```

If Rich is unavailable, `--ui auto` and even an explicit `--ui fancy` gracefully fall back to the plain UI.

## What the live dashboard shows

- source SQL/DBC checks
- seed, item count, selected classes, enabled features, and output path
- true overall progress through skeleton generation and item finalization
- per-class progress bars
- current class, level, quality, and item name
- generated Legendary callouts
- complete generated set callouts
- proc, On Use, and Equip-effect discoveries
- validation progress and result
- output-writing progress for loot pools, SQL, Item.dbc, ItemSet.dbc, manifests, checksums, and README
- final quality and feature counts plus elapsed time

The live discovery panel is bounded, so long runs do not flood the terminal. Plain/redirected output stays intentionally quieter; `--show-items` expands it when desired.
