from pathlib import Path

import generate_pack as gp


def test_default_data_dir_remains_script_data_dir():
    args = gp.parse_args([])
    assert Path(args.data_dir).resolve() == (gp.ROOT / "Data").resolve()


def test_output_root_accepts_external_directory(tmp_path):
    args = gp.parse_args(["--output-root", str(tmp_path)])
    assert args.output_root == tmp_path


def test_loot_destinations_can_be_empty():
    args = gp.parse_args(["--loot-destinations"])
    assert args.loot_destinations == []


def test_loot_destinations_accept_subset():
    args = gp.parse_args(["--loot-destinations", "world", "raid"])
    assert args.loot_destinations == ["world", "raid"]
