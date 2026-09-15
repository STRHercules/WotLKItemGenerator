from pathlib import Path
import importlib.util

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
