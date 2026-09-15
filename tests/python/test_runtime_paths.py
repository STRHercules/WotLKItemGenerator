from pathlib import Path

import generate_pack as gp


def test_default_data_dir_remains_script_data_dir():
    args = gp.parse_args([])
    assert Path(args.data_dir).resolve() == (gp.ROOT / "Data").resolve()


def test_output_root_accepts_external_directory(tmp_path):
    args = gp.parse_args(["--output-root", str(tmp_path)])
    assert args.output_root == tmp_path


def test_reference_helpers_resolve_defaults_from_data_dir(tmp_path, monkeypatch):
    captured = {}
    def harvest(path):
        captured["item"] = path
        return [], [], {}

    def loot_rows(path):
        captured["world"] = path
        return [(0, 0, 7, 0, 0, 0, 0, 0, 0, "World Loot Level 80")]

    def reference_entries(path):
        captured["reference"] = path
        return {7}

    monkeypatch.setattr(gp, "harvest_reference_catalog", harvest)
    monkeypatch.setattr(gp, "_load_loot_insert_rows", loot_rows)
    monkeypatch.setattr(gp, "_load_reference_entries", reference_entries)

    gp.validate_reference_catalog(data_dir=tmp_path)
    assert gp.load_world_loot_references(data_dir=tmp_path) == {7: 80}
    assert captured == {
        "item": (tmp_path / "item_template.sql").resolve(),
        "world": (tmp_path / "creature_loot_template.sql").resolve(),
        "reference": (tmp_path / "reference_loot_template.sql").resolve(),
    }


def test_optional_gameobject_sources_stay_in_selected_data_dir(tmp_path):
    for filename in ("gameobject.sql", "gameobject_template.sql", "gameobject_loot_template.sql"):
        (tmp_path / filename).touch()
    expected = tuple((tmp_path / filename).resolve() for filename in (
        "gameobject.sql", "gameobject_template.sql", "gameobject_loot_template.sql"))
    assert gp.resolve_optional_gameobject_sources(data_dir=tmp_path) == expected


def test_configured_output_uses_requested_output_root(tmp_path, monkeypatch):
    for filename in (
        "creature_loot_template.sql", "reference_loot_template.sql", "item_template.sql",
        "Item.dbc", "ItemSet.dbc", "Spell.dbc", "SpellItemEnchantment.dbc",
        "disenchant_loot_template.sql", "spell_proc.sql", "spell_script_names.sql",
        "Map.dbc", "MapDifficulty.dbc", "DungeonMap.dbc", "creature.sql",
        "creature_template.sql", "instance_encounters.sql",
    ):
        (tmp_path / filename).touch()
    monkeypatch.setattr(gp, "_load_source_cache", lambda *_: {
        "reference_catalog": ([], [], {}), "feature_catalog": {},
        "encounter_source_catalog": {}, "default_encounter_manifest": {"profiles": []},
    })
    args = gp.parse_args(["--data-dir", str(tmp_path), "--output-root", str(tmp_path / "out"),
                          "--seed", "123", "--number", "1", "--disable", "all-new"])
    args.loot_destinations = []
    runtime = gp.configure_runtime(args=args)
    assert runtime["output_dir"] == (tmp_path / "out" / "generated-123").resolve()
    assert gp.LOOT_DESTINATIONS == set()

    del args.loot_destinations
    gp.configure_runtime(args=args)
    assert gp.LOOT_DESTINATIONS == set(gp.DEFAULT_LOOT_DESTINATIONS)


def test_loot_destinations_can_be_empty():
    args = gp.parse_args(["--loot-destinations"])
    assert args.loot_destinations == []


def test_loot_destinations_accept_subset():
    args = gp.parse_args(["--loot-destinations", "world", "raid"])
    assert args.loot_destinations == ["world", "raid"]
