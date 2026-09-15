import generate_pack as gp


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
