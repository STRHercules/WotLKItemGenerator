import generate_pack as gp
import json
from types import SimpleNamespace

import pytest


def test_source_inspection_reports_missing_required_files(tmp_path):
    manifest = gp.inspect_source_directory(tmp_path)
    assert manifest["data_dir"] == str(tmp_path.resolve())
    assert manifest["ready"] is False
    assert any(row["required"] and not row["found"] for row in manifest["files"])


def test_source_inspection_reports_complete_required_directory(tmp_path):
    for names in gp.INTERACTIVE_REQUIRED_DATA_FILES.values():
        for name in names:
            (tmp_path / name).touch()

    manifest = gp.inspect_source_directory(tmp_path)
    assert manifest["ready"] is True
    assert all(row["found"] for row in manifest["files"] if row["required"])


def test_source_inspection_matches_required_and_optional_tables(tmp_path):
    optional_names = [name for names in gp.INTERACTIVE_OPTIONAL_DATA_FILES.values() for name in names]
    (tmp_path / optional_names[0]).touch()

    manifest = gp.inspect_source_directory(tmp_path)
    expected = [
        (kind, name, True)
        for kind, names in gp.INTERACTIVE_REQUIRED_DATA_FILES.items()
        for name in names
    ] + [
        (kind, name, False)
        for kind, names in gp.INTERACTIVE_OPTIONAL_DATA_FILES.items()
        for name in names
    ]

    assert len(manifest["files"]) == len(expected)
    assert [(row["kind"], row["name"], row["required"]) for row in manifest["files"]] == expected
    assert len({(row["kind"], row["name"]) for row in manifest["files"]}) == len(expected)
    assert all(set(row) == {"kind", "name", "required", "found", "path"} for row in manifest["files"])
    assert manifest["files"][-len(optional_names)]["found"] is True
    assert all(not row["found"] for row in manifest["files"][-len(optional_names) + 1:])


def test_inspect_sources_cli_emits_one_json_object_without_loading_catalogs(tmp_path, monkeypatch, capsys):
    def fail_if_loaded(*args, **kwargs):
        raise AssertionError("catalog loading should not run")

    for name in (
        "create_terminal_ui", "configure_runtime", "load_encounter_source_catalog",
        "harvest_reference_catalog", "load_feature_catalogs", "build_runtime_skeletons",
        "finish_items", "write_outputs",
    ):
        monkeypatch.setattr(gp, name, fail_if_loaded)

    gp.main(["--inspect-sources", "--data-dir", str(tmp_path)])

    lines = capsys.readouterr().out.splitlines()
    assert len(lines) == 1
    assert json.loads(lines[0]) == gp.inspect_source_directory(tmp_path)


def test_inspect_sources_accepts_interactive_namespace_without_flag(tmp_path, monkeypatch):
    monkeypatch.setattr(gp.sys, "argv", ["generate_pack.py"])
    monkeypatch.setattr(gp, "interactive_setup", lambda: SimpleNamespace(data_dir=tmp_path))

    def fail_after_inspection(*args, **kwargs):
        raise AssertionError("normal interactive flow should continue")

    monkeypatch.setattr(gp, "create_terminal_ui", fail_after_inspection)

    with pytest.raises(AssertionError, match="normal interactive flow"):
        gp.main()
