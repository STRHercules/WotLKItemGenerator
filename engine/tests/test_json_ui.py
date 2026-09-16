import io
import json
from argparse import Namespace
from pathlib import Path

import generate_pack
from generate_pack import JsonEventUI


def one_event(callback):
    stream = io.StringIO()
    ui = JsonEventUI(stream=stream)
    callback(ui)
    lines = [line for line in stream.getvalue().splitlines() if line]
    assert len(lines) == 1
    return json.loads(lines[0])


def test_progress_event_is_ndjson():
    event = one_event(lambda ui: ui.progress(
        2,
        10,
        current="Mage",
        class_name="Mage",
        class_completed=2,
        class_total=3,
    ))
    assert event == {
        "protocol_version": 1,
        "type": "progress",
        "completed": 2,
        "total": 10,
        "current": "Mage",
        "class_name": "Mage",
        "class_completed": 2,
        "class_total": 3,
    }


def test_validation_event_contains_repairs_and_errors():
    event = one_event(lambda ui: ui.validation(
        ["bad item"],
        [{"entry": 1, "old_name": "A", "new_name": "B"}],
    ))
    assert event["type"] == "validation"
    assert event["error_count"] == 1
    assert event["errors"] == ["bad item"]
    assert event["name_repair_count"] == 1
    assert event["name_repairs"][0]["new_name"] == "B"


def test_configured_event_serializes_paths_and_sets():
    event = one_event(lambda ui: ui.configure({
        "seed": "123",
        "number": 42,
        "classes": ["Mage"],
        "output_dir": Path("/tmp/out"),
        "disabled_features": {"sets"},
        "class_counts": {"Mage": 42},
        "expansion": "Wrath",
        "magic_effects": "All",
        "loot_destinations": ["world"],
    }))
    assert event["type"] == "configured"
    assert event["seed"] == "123"
    assert event["number"] == 42
    output_dir = Path(event["output_dir"])
    assert output_dir.parent.name == "tmp"
    assert output_dir.name == "out"
    assert event["disabled_features"] == ["sets"]


def test_notable_item_becomes_discovery_event():
    event = one_event(lambda ui: ui.item({
        "Quality": 5,
        "name": "Crown of Test",
        "class_name": "Paladin",
        "RequiredLevel": 80,
        "ItemLevel": 264,
        "sockets": [1, 2],
    }))
    assert event["type"] == "discovery"
    assert event["kind"] == "legendary"
    assert event["title"] == "Crown of Test"


def test_json_mode_is_available_without_rich_or_tty():
    assert generate_pack.resolve_ui_mode("json", is_tty=False, rich_available=False) == "json"
    args = Namespace(ui="json", quiet=True, no_animations=True, show_items=False)
    assert isinstance(generate_pack.create_terminal_ui(args), JsonEventUI)
