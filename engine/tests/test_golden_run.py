from __future__ import annotations

import csv
import hashlib
import json
import os
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path

import pytest


ENGINE = Path(__file__).resolve().parents[1] / "generate_pack.py"
REQUIRED_FIXTURE_FILES = (
    "Item.dbc",
    "ItemSet.dbc",
    "Spell.dbc",
    "SpellItemEnchantment.dbc",
    "Map.dbc",
    "MapDifficulty.dbc",
    "DungeonMap.dbc",
    "creature_loot_template.sql",
    "reference_loot_template.sql",
    "item_template.sql",
    "disenchant_loot_template.sql",
    "spell_proc.sql",
    "spell_script_names.sql",
    "creature.sql",
    "creature_template.sql",
    "instance_encounters.sql",
)


@dataclass(frozen=True)
class GeneratedPack:
    output_dir: Path
    stdout: str
    stderr: str


def _fixture_root() -> Path:
    raw = os.environ.get("WOTLK_FIXTURE_DATA")
    if not raw:
        pytest.skip("WOTLK_FIXTURE_DATA is not set; legal WotLK/AzerothCore fixture data is external")
    root = Path(raw).expanduser().resolve()
    missing = [name for name in REQUIRED_FIXTURE_FILES if not (root / name).is_file()]
    if missing:
        pytest.skip("WOTLK_FIXTURE_DATA is incomplete: " + ", ".join(missing))
    return root


def run_engine(mode: str, fixture_root: Path, output_root: Path, seed: str, number: int) -> GeneratedPack:
    output_root.mkdir(parents=True, exist_ok=True)
    command = [
        sys.executable,
        str(ENGINE),
        "--data-dir",
        str(fixture_root),
        "--output-root",
        str(output_root),
        "--source-cache-file",
        str(output_root / "source-cache.json.gz"),
        "--seed",
        seed,
        "--number",
        str(number),
        "--class",
        "Warrior",
        "--expansion",
        "Wrath",
        "--magic-effects",
        "None",
        "--loot-destinations",
        "none",
        "--disable",
        "all-new",
        "--no-legendaries",
        "--no-sockets",
        "--no-animations",
        "--ui",
        mode,
    ]
    if mode == "plain":
        command.append("--quiet")

    completed = subprocess.run(command, text=True, capture_output=True, check=False)
    assert completed.returncode == 0, (
        f"engine {mode} run failed with exit code {completed.returncode}\n"
        f"stdout:\n{completed.stdout}\nstderr:\n{completed.stderr}"
    )

    if mode == "json":
        lines = [line for line in completed.stdout.splitlines() if line.strip()]
        assert lines, "JSON mode emitted no protocol events"
        events = [json.loads(line) for line in lines]
        assert all(event.get("protocol") == 1 for event in events)
        assert events[-1]["type"] == "complete"

    output_dir = output_root / f"generated-{seed}"
    assert output_dir.is_dir()
    return GeneratedPack(output_dir, completed.stdout, completed.stderr)


def _read_ndjson(path: Path) -> list[dict]:
    return [json.loads(line) for line in path.read_text(encoding="utf-8").splitlines() if line.strip()]


def _read_csv(path: Path) -> list[dict[str, str]]:
    with path.open("r", encoding="utf-8", newline="") as stream:
        return list(csv.DictReader(stream))


def _stable_validation(path: Path) -> dict:
    report = json.loads(path.read_text(encoding="utf-8"))
    # Keep generator-result fields only. Future diagnostic/path metadata should not make
    # two otherwise equivalent runs fail merely because their output roots differ.
    return {
        "item_count": report.get("item_count", report.get("total_items")),
        "validation_errors": report.get("validation_errors"),
        "quality_distribution": report.get("quality_distribution", report.get("quality_counts")),
        "feature_counts": report.get("feature_counts"),
        "name_repair_count": report.get("name_repair_count"),
    }


def _artifact_digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _generated_binary_and_sql_files(root: Path) -> dict[str, str]:
    result: dict[str, str] = {}
    for path in sorted(root.rglob("*")):
        if path.is_file() and path.suffix.lower() in {".dbc", ".sql"}:
            result[path.relative_to(root).as_posix()] = _artifact_digest(path)
    return result


def test_cli_and_json_mode_generate_equivalent_pack(tmp_path: Path) -> None:
    fixture_root = _fixture_root()
    seed = "4242424242"
    number = 10

    cli = run_engine("plain", fixture_root, tmp_path / "cli", seed, number)
    gui = run_engine("json", fixture_root, tmp_path / "json", seed, number)

    cli_items = _read_ndjson(cli.output_dir / "items.ndjson")
    gui_items = _read_ndjson(gui.output_dir / "items.ndjson")
    assert cli_items == gui_items
    assert len(cli_items) == number

    assert _read_csv(cli.output_dir / "manifest.csv") == _read_csv(gui.output_dir / "manifest.csv")

    cli_validation = _stable_validation(cli.output_dir / "validation_report.json")
    gui_validation = _stable_validation(gui.output_dir / "validation_report.json")
    assert cli_validation == gui_validation
    assert cli_validation["item_count"] == number
    assert cli_validation["validation_errors"] == 0

    cli_artifacts = _generated_binary_and_sql_files(cli.output_dir)
    gui_artifacts = _generated_binary_and_sql_files(gui.output_dir)
    assert cli_artifacts
    assert cli_artifacts == gui_artifacts
