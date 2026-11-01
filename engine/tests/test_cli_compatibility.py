import pytest

import generate_pack


def test_gui_cli_accepts_multiple_classes():
    args = generate_pack.parse_args(["--classes", "Mage,Druid,Death Knight"])
    assert args.class_names == ("Mage", "Druid", "Death Knight")
    assert args.class_name is None


def test_single_and_multiple_class_flags_are_mutually_exclusive():
    with pytest.raises(SystemExit):
        generate_pack.parse_args(["--class", "Mage", "--classes", "Mage,Druid"])


def test_magic_effect_mode_disables_incompatible_effect_features():
    args = generate_pack.parse_args(["--magic-effects", "On Hit"])
    assert args.magic_effects == "On Hit"
    assert "spell-effects" in args.disabled_features
    assert "on-use" in args.disabled_features
    assert "chance-on-hit" not in args.disabled_features


def test_gui_cli_can_disable_legendaries():
    args = generate_pack.parse_args(["--no-legendaries"])
    assert args.generate_legendaries is False


def test_rarity_defaults_to_all_and_accepts_selected_quality():
    assert generate_pack.parse_args([]).rarity == "All"
    assert generate_pack.parse_args(["--rarity", "Epic"]).rarity == "Epic"


@pytest.mark.parametrize(
    ("rarity", "quality_id"),
    [("Common", 1), ("Uncommon", 2), ("Rare", 3), ("Epic", 4), ("Legendary", 5)],
)
def test_selected_rarity_pins_generated_quality(rarity, quality_id):
    assert generate_pack.quality(80, 284, 123456, rarity) == quality_id


def test_legendary_oath_name_uses_defined_epithet_pool(monkeypatch):
    monkeypatch.setattr(generate_pack, "SEED", 123456)

    assert generate_pack.h64(10, "legend_pattern", 0) % 4 == 2
    assert ", Oath of the " in next(generate_pack.legendary_name_candidates(10, "neck"))


@pytest.mark.parametrize("rarity,quality_id", [("Uncommon", 2), ("Rare", 3)])
def test_selected_rarity_ignores_default_quality_level_caps(monkeypatch, rarity, quality_id):
    monkeypatch.setattr(generate_pack, "RARITY", rarity)
    monkeypatch.setattr(generate_pack, "TARGET_ITEM_COUNT", None)
    monkeypatch.setattr(generate_pack, "CLASS_ITEM_COUNTS", None)
    monkeypatch.setattr(generate_pack, "CONTENT_MANIFEST", None)
    item = {
        "entry": generate_pack.entry_for_class("Mage", 0),
        "name": "Arcane Band",
        "class_name": "Mage",
        "class_mask": generate_pack.CLASS_MASK_BY_NAME["Mage"],
        "RequiredLevel": 80,
        "ItemLevel": 284,
        "Quality": quality_id,
        "displayid": 1,
        "reference_entry": 1,
        "stats": [(3, 1)],
        "sockets": [],
        "item_class": 4,
        "subclass": 0,
        "InventoryType": 2,
        "kind": "neck",
    }

    assert generate_pack.validate([item]) == []


def test_legendary_set_piece_keeps_its_set_name(monkeypatch):
    monkeypatch.setattr(generate_pack, "RARITY", "Legendary")
    monkeypatch.setattr(generate_pack, "TARGET_ITEM_COUNT", None)
    monkeypatch.setattr(generate_pack, "CLASS_ITEM_COUNTS", None)
    monkeypatch.setattr(generate_pack, "CONTENT_MANIFEST", None)
    monkeypatch.setattr(generate_pack, "SET_SIZE", 2)
    item = {
        "entry": generate_pack.entry_for_class("Mage", 0),
        "name": "Pendant of the Dawn",
        "class_name": "Mage",
        "class_mask": generate_pack.CLASS_MASK_BY_NAME["Mage"],
        "RequiredLevel": 80,
        "ItemLevel": 284,
        "Quality": 5,
        "displayid": 1,
        "reference_entry": 1,
        "stats": [(3, 1), (4, 1), (5, 1), (6, 1), (7, 1)],
        "sockets": [1, 2],
        "item_class": 4,
        "subclass": 0,
        "InventoryType": 2,
        "kind": "neck",
        "slot": "neck",
        "itemset": 1,
        "set_name": "Raiment of the Dawn",
        "set_bonuses": ((2, 123),),
        "description": "A legendary set piece.",
    }

    assert generate_pack.validate([item]) == []
    assert generate_pack.validate([{**item, "itemset": 0}]) == [
        "legendary bespoke-design policy violation"
    ]


@pytest.mark.parametrize("required_level", [40, 70])
def test_legendary_socket_policy_covers_all_levels(monkeypatch, required_level):
    monkeypatch.setattr(generate_pack, "GENERATE_SOCKETS", True)
    monkeypatch.setattr(generate_pack, "r01", lambda *_: 0.99)

    sockets = generate_pack.socket_colors(required_level, 100, 5, 123, "neck", 4)

    assert len(sockets) >= 2


def test_low_level_legendary_gets_five_stats(monkeypatch):
    monkeypatch.setattr(generate_pack, "SEED", 123456)
    stats = generate_pack.make_stats(
        "Warrior", "strength_dps", 10, 15, 5, 123, "two_hand", 2, force_count=5
    )

    assert len(stats) == 5


def test_gui_cli_accepts_selected_loot_destinations():
    args = generate_pack.parse_args(["--loot-destinations", "world", "raid"])
    assert args.loot_destinations == frozenset({"world", "raid"})


def test_gui_cli_can_disable_loot_insertion():
    args = generate_pack.parse_args(["--loot-destinations", "none"])
    assert args.loot_destinations == frozenset()
