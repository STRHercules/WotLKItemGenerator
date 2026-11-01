from pathlib import Path

import pytest

import generate_pack


@pytest.fixture
def encounter_sources(tmp_path, monkeypatch):
    tables = {
        "creature_template": (
            ("entry", "name", "lootid", "difficulty_entry_1", "difficulty_entry_2", "difficulty_entry_3"),
            "(101,'First',0,0,0,0),(102,'Second',0,0,0,0),(103,'Third',0,0,0,0)",
        ),
        "instance_encounters": (
            ("entry", "creditType", "creditEntry", "lastEncounterDungeon", "comment"),
            "(1,0,101,0,'Test')",
        ),
        "creature_loot_template": (("Entry", "Item"), "(101,1)"),
        "reference_loot_template": (("Entry", "Item"), "(1,1)"),
    }
    for name, (columns, values) in tables.items():
        (tmp_path / f"{name}.sql").write_text(
            f"CREATE TABLE `{name}` (\n"
            + ",\n".join(f"`{column}` text" for column in columns)
            + f"\n) ENGINE=InnoDB;\nINSERT INTO `{name}` VALUES {values};\n",
            encoding="utf-8",
        )
    map_row = [0] * 64
    map_row[0], map_row[2] = 33, 1
    monkeypatch.setattr(
        generate_pack, "_read_wdbc_records",
        lambda path, **kwargs: ({33: map_row} if Path(path).name == "Map.dbc" else {}, b"\0", 0, 0),
    )

    def load(columns, values):
        (tmp_path / "creature.sql").write_text(
            "CREATE TABLE `creature` (\n"
            + ",\n".join(f"`{column}` int" for column in columns)
            + f"\n) ENGINE=InnoDB;\nINSERT INTO `creature` VALUES {values};\n",
            encoding="utf-8",
        )
        return generate_pack.load_encounter_source_catalog(
            *(tmp_path / name for name in (
                "Map.dbc", "MapDifficulty.dbc", "DungeonMap.dbc", "creature.sql",
                "creature_template.sql", "instance_encounters.sql",
                "creature_loot_template.sql", "reference_loot_template.sql",
            )),
            scope_expansion="All", scope_destinations={"dungeon"},
        )

    return load


@pytest.mark.parametrize(("columns", "values", "expected"), [
    (("guid", "id", "map"), "(1,101,33),(2,101,33),(3,102,0)", {101: {33}}),
    (("guid", "id1", "id2", "id3", "map"),
     "(1,101,102,103,33),(2,101,0,0,33),(3,104,105,106,0)",
     {101: {33}, 102: {33}, 103: {33}}),
    (("guid", "ID1", "map"), "(1,101,33),(2,0,33)", {101: {33}}),
])
def test_creature_spawn_identifiers(encounter_sources, columns, values, expected):
    catalog = encounter_sources(columns, values)

    assert catalog["creature_maps"] == expected
    assert catalog["source_audit"]["spawn_creature_count"] == len(expected)


@pytest.mark.parametrize("columns", [("guid", "entry", "map"), ("guid", "id1", "zone")])
def test_unsupported_creature_schema_reports_source(encounter_sources, columns):
    with pytest.raises(ValueError, match=r"creature\.sql.*requires.*map.*id"):
        encounter_sources(columns, "(1,101,33)")
