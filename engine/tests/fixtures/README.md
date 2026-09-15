# Golden regression fixture data

The WotLK Item Forge repository intentionally does **not** redistribute World of Warcraft client DBC files or a production AzerothCore data dump.

`test_golden_run.py` is a real CLI-vs-JSON regression harness. To enable it, set the `WOTLK_FIXTURE_DATA` environment variable to a directory containing a legally obtained, test-safe WotLK 3.3.5a/AzerothCore fixture set.

The directory must contain these generator inputs:

## DBC

- `Item.dbc`
- `ItemSet.dbc`
- `Spell.dbc`
- `SpellItemEnchantment.dbc`
- `Map.dbc`
- `MapDifficulty.dbc`
- `DungeonMap.dbc`

## SQL

- `creature_loot_template.sql`
- `reference_loot_template.sql`
- `item_template.sql`
- `disenchant_loot_template.sql`
- `spell_proc.sql`
- `spell_script_names.sql`
- `creature.sql`
- `creature_template.sql`
- `instance_encounters.sql`

Optional gameobject sources may also be present but are not required by the regression command because loot placement is disabled for the small equivalence run.

Example in PowerShell:

```powershell
$env:WOTLK_FIXTURE_DATA = 'C:\wotlk-test-data'
python -m pytest engine/tests/test_golden_run.py -v
```

The harness runs the same fixed configuration twice, once through the ordinary quiet CLI UI and once through the JSON GUI protocol. It compares the generated item NDJSON, manifest, validation summary, and every generated SQL/DBC artifact that is present in both packs. It also requires every JSON-mode stdout line to parse as one protocol event.

The fixture is deliberately external so the repository can remain redistributable.
