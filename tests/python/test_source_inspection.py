import generate_pack as gp
import json


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


def test_inspect_sources_cli_emits_one_json_object_without_loading_catalogs(tmp_path, monkeypatch, capsys):
    def fail_if_loaded(*args, **kwargs):
        raise AssertionError("catalog loading should not run")

    monkeypatch.setattr(gp, "configure_runtime", fail_if_loaded)

    gp.main(["--inspect-sources", "--data-dir", str(tmp_path)])

    lines = capsys.readouterr().out.splitlines()
    assert len(lines) == 1
    assert json.loads(lines[0]) == gp.inspect_source_directory(tmp_path)
