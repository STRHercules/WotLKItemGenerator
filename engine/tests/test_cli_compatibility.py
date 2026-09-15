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


def test_gui_cli_accepts_selected_loot_destinations():
    args = generate_pack.parse_args(["--loot-destinations", "world", "raid"])
    assert args.loot_destinations == frozenset({"world", "raid"})


def test_gui_cli_can_disable_loot_insertion():
    args = generate_pack.parse_args(["--loot-destinations", "none"])
    assert args.loot_destinations == frozenset()
