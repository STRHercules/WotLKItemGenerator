# AzerothCore WotLK Random Item Generator

![WotLK Item Generator terminal dashboard](Screenshots/Stage1.png)

Deterministic custom equipment generation for AzerothCore / World of Warcraft: Wrath of the Lich King 3.3.5a (build 12340).

The default run creates 100,000 items across the ten WotLK classes and writes:

- AzerothCore `item_template` and loot SQL
- GM `.additem` command files
- merged client `Item.dbc`
- matching client/server `ItemSet.dbc` when sets are enabled
- validation, collision-check, rollback, and placement reports

> The generator writes files for review and import. It does not connect to or modify a live database.

## Features

- deterministic seeds and reproducible output
- role- and equipment-compatible stats, levels 1-80, and Death Knight levels 55-80
- verified stock appearances, effects, socket bonuses, disenchant data, and five-piece sets
- shared world-loot pools plus automatic or manifest-driven dungeon/raid/quest placement
- optional Rich terminal dashboard with plain and quiet modes

## Requirements

- Python 3
- a matching AzerothCore/WotLK source bundle under `Data/`

The SQL and DBC inputs are local files ignored by Git. The default bundle includes the stock item, loot, spell, set, enchantment, and encounter sources used by the generator. See [Architecture.md](Architecture.md#expected-project-layout) for the complete list and path overrides.

## Quick start

Windows / PowerShell:

```powershell
py generate_pack.py
```

Linux / macOS:

```bash
python3 ./generate_pack.py
```

Small deterministic smoke test:

```powershell
py generate_pack.py --seed 1234567890 --number 100
```

Single-class run:

```powershell
py generate_pack.py --class warrior --number 100
```

Rich is optional. Install it only for the live dashboard:

```powershell
py -m pip install rich
py generate_pack.py --ui fancy
```

## Defaults and limits

| Setting | Default |
| --- | ---: |
| Total items | 100,000 |
| Items per class | 10,000 |
| Maximum total | 200,000 |
| Maximum per class | 20,000 |
| World-loot attachment chance | 2% |
| Death Knight required level | 55-80 |

Use `--number` and `--class` to control pack size. Use `--seed` when you need the same pack again.

## Common options

```text
--content-manifest PATH       Targeted recipes, dungeon/raid loot, and quest rewards
--quest-template-source PATH  Source used for mapped quest rewards
--loot-chance PERCENT         World-loot attachment chance
--disable FEATURE ...         Disable sets, effects, procs, on-use, sockets, or disenchant
--set-rate / --set-min-level / --set-size
--ui auto|fancy|plain         Terminal presentation
--quiet                       Errors and final completion line only
```

Run `py generate_pack.py --help` for the complete option list. Use [Docs/content_manifest.example.json](Docs/content_manifest.example.json) for targeted-content syntax.

## Generated output

Each run creates `generated-<seed>/`, including:

- `sql/` and `sql/IMPORT_ORDER.txt`
- `client/Item.dbc` and optional `client/ItemSet.dbc`
- `server/dbc/ItemSet.dbc`
- `additem_commands/`
- `validation_report.json`, `manifest.csv`, and placement reports
- `00_SCHEMA_CHECK.sql`
- `00_PREIMPORT_COLLISION_CHECK.sql`
- `99_REMOVE_GENERATED_ITEMS.sql`
- a self-contained generated `README.md`

## Import safely

1. Back up `acore_world`.
2. Run `00_SCHEMA_CHECK.sql`.
3. Run `00_PREIMPORT_COLLISION_CHECK.sql`; stop if any collision count is non-zero.
4. Import the files listed in `sql/IMPORT_ORDER.txt`.
5. Copy the generated server `ItemSet.dbc` when sets are enabled.
6. Package the generated client DBCs under `DBFilesClient/`.
7. Restart worldserver; clear `Cache/WDB/<locale>/itemcache.wdb` if names or icons are stale.

For removal, run `99_REMOVE_GENERATED_ITEMS.sql` and restore the previous client DBC/patch separately.

## Documentation

- [Architecture and technical reference](Architecture.md)
- [CLI dashboard](Docs/CLI_UI.md)
- [Fixes and compatibility notes](Docs/FIXES.md)
- [Targeted-content example](Docs/content_manifest.example.json)
- [Generated example pack](Examples/8449571193/README.md)
