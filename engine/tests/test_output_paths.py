from pathlib import Path
import importlib.util
import json
import re

ENGINE = Path(__file__).parents[1] / "generate_pack.py"


def load_engine():
    spec = importlib.util.spec_from_file_location("wotlk_engine", ENGINE)
    module = importlib.util.module_from_spec(spec)
    assert spec.loader
    spec.loader.exec_module(module)
    return module


def test_output_root_is_explicit(tmp_path):
    engine = load_engine()
    args = engine.parse_args(["--number", "1", "--output-root", str(tmp_path)])
    assert args.output_root == tmp_path


def test_data_dir_can_be_overridden(tmp_path):
    engine = load_engine()
    args = engine.parse_args(["--number", "1", "--data-dir", str(tmp_path)])
    assert args.data_dir == tmp_path


def test_implicit_data_source_uses_selected_data_dir(tmp_path):
    engine = load_engine()
    resolved = engine._resolve_data_source(tmp_path, None, "Spell.dbc")
    assert resolved == tmp_path / "Spell.dbc"


def test_explicit_source_wins_over_selected_data_dir(tmp_path):
    engine = load_engine()
    explicit = tmp_path / "custom" / "Spell.dbc"
    resolved = engine._resolve_data_source(tmp_path / "Data", explicit, "Spell.dbc")
    assert resolved == explicit.resolve()


def test_output_directory_uses_selected_root(tmp_path):
    engine = load_engine()
    assert engine._output_dir_for_seed(tmp_path, "1234") == tmp_path.resolve() / "generated-1234"


def test_source_cache_key_uses_engine_build_identity():
    engine = load_engine()
    key = engine._source_cache_key([], expansion="All")
    assert key["generator"] == f"{engine.GENERATOR_VERSION}:{engine.ENGINE_BUILD_ID}"


def test_source_cache_file_can_be_overridden(tmp_path):
    engine = load_engine()
    cache = tmp_path / "cache" / "source-cache.json.gz"
    args = engine.parse_args(["--number", "1", "--source-cache-file", str(cache)])
    assert args.source_cache_file == cache


def test_source_cache_files_walks_source_tree_once(tmp_path, monkeypatch):
    engine = load_engine()
    (tmp_path / "src" / "server" / "scripts").mkdir(parents=True)
    (tmp_path / "src" / "include").mkdir()
    script = tmp_path / "src" / "server" / "scripts" / "example.cpp"
    header = tmp_path / "src" / "include" / "example.h"
    script.write_text("// script")
    header.write_text("// header")
    original_rglob = Path.rglob
    calls = []

    def counted_rglob(path, pattern):
        calls.append(path)
        return original_rglob(path, pattern)

    monkeypatch.setattr(Path, "rglob", counted_rglob)
    files = engine._source_cache_files(tmp_path)

    assert calls == [tmp_path / "src"]
    assert files == tuple(sorted((script, header), key=lambda path: str(path)))
    assert len(files) == len(set(files))


def test_release_version_contract():
    root = Path(__file__).parents[2]
    package = json.loads((root / "package.json").read_text())
    tauri = json.loads((root / "src-tauri" / "tauri.conf.json").read_text())
    cargo = (root / "src-tauri" / "Cargo.toml").read_text()
    engine = load_engine()

    assert package["version"] == "0.1.1"
    assert tauri["version"] == "0.1.1"
    assert re.search(r'^version = "([^"]+)"', cargo, re.MULTILINE).group(1) == "0.1.1"
    assert engine.GENERATOR_VERSION == "0.1.1"
    assert engine.EVENT_PROTOCOL_VERSION == 1
    assert engine.CACHE_SCHEMA_VERSION == 2


def test_configure_runtime_classifies_source_cache_states(tmp_path, monkeypatch):
    engine = load_engine()
    data_dir = tmp_path / "data"
    data_dir.mkdir()
    for name in (
        "creature_loot_template.sql", "reference_loot_template.sql", "item_template.sql",
        "Item.dbc", "ItemSet.dbc", "Spell.dbc", "SpellItemEnchantment.dbc",
        "disenchant_loot_template.sql", "spell_proc.sql", "spell_script_names.sql",
    ):
        (data_dir / name).touch()
    args = engine.parse_args([
        "--class", "Mage", "--number", "1", "--seed", "1", "--disable", "all-new",
        "--loot-destinations", "world", "--data-dir", str(data_dir),
        "--output-root", str(tmp_path), "--source-cache-file", str(tmp_path / "cache.gz"),
    ])
    current_cache = [None]
    monkeypatch.setattr(engine, "_source_cache_key", lambda *parts: {})
    monkeypatch.setattr(engine, "_load_source_cache", lambda path, key: current_cache[0])
    monkeypatch.setattr(engine, "_save_source_cache", lambda *parts: True)
    monkeypatch.setattr(engine, "harvest_reference_catalog", lambda path: ({}, {}, {"errors": []}))
    complete_cache = {"reference_catalog": ({}, {}, {"errors": []})}

    for cache, expected_status in ((None, "miss"), ({}, "partial"), (complete_cache, "hit")):
        current_cache[0] = cache
        runtime = engine.configure_runtime(args=args)
        assert runtime["source_cache_status"] == expected_status
        assert runtime["source_catalog_rebuilt"] is (expected_status != "hit")
        assert isinstance(runtime["source_cache_elapsed_ms"], float)
