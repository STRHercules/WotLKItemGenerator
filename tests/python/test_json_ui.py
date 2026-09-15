import io
import json
from pathlib import Path
from unittest.mock import patch

import generate_pack as gp


def test_json_line_ui_emits_one_json_object_per_line():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)
    ui.phase("Generating item skeletons", total=100, detail="test")
    event = json.loads(stream.getvalue().strip())
    assert event["type"] == "phase"
    assert event["payload"]["total"] == 100
    assert stream.getvalue().endswith("\n")


def _records(stream):
    return [json.loads(line) for line in stream.getvalue().splitlines()]


def test_json_event_stream_takes_precedence_over_quiet_and_terminal_mode():
    args = gp.parse_args(["--event-stream", "jsonl", "--quiet", "--ui", "fancy"])

    ui = gp.create_terminal_ui(args, stream=io.StringIO(), is_tty=True, rich_available=True)

    assert isinstance(ui, gp.JsonLineUI)


def test_json_configure_emits_a_small_runtime_summary():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)

    ui.configure({"seed": "123", "number": 10, "classes": ("Warrior",),
                  "map_difficulties": {(601, 1): "normal"}})

    record = _records(stream)[0]
    assert record["type"] == "configure"
    assert record["payload"]["runtime"] == {
        "seed": "123", "number": 10, "classes": ["Warrior"]
    }


def test_json_progress_throttles_repeated_percentage_and_emits_class_change():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)

    with patch.object(gp.time, "monotonic", side_effect=[1.00, 1.01, 1.02, 1.04, 1.08]):
        ui.progress(1, 1000)
        ui.progress(2, 1000)
        ui.progress(3, 1000, class_name="Warrior")
        ui.progress(4, 1000, class_name="Warrior")
        ui.progress(5, 1000, class_name="Warrior")

    records = _records(stream)
    assert [record["type"] for record in records] == ["progress", "progress", "progress"]
    assert records[1]["payload"]["class_name"] == "Warrior"


def test_json_progress_emits_percentage_change_immediately():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)

    with patch.object(gp.time, "monotonic", side_effect=[2.00, 2.01]):
        ui.progress(1, 1000)
        ui.progress(11, 1000)

    assert len(_records(stream)) == 2


def test_json_discovery_keeps_notable_item_set_deduplication():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)
    item = {
        "Quality": 4,
        "itemset": 902,
        "set_name": "Battlegear of the Frozen Star",
        "name": "Helm of the Frozen Star",
        "class_name": "Warrior",
        "role": "tank",
    }

    ui.item(item)
    ui.item(item)

    records = _records(stream)
    assert len(records) == 1
    assert records[0]["type"] == "discovery"
    assert records[0]["payload"]["kind"] == "set"


def test_json_phase_done_complete_error_and_cancelled_payloads_are_structured():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)
    ui.phase("Writing output pack", total=10)
    ui.phase_done(detail="finished")
    ui.complete({"item_count": 10}, elapsed=1.25, output_dir=Path("generated-123"))
    ui.error("source missing")
    ui.cancelled()

    records = _records(stream)
    assert records[1]["type"] == "phase_done"
    assert records[1]["payload"] == {"name": "Writing output pack", "detail": "finished"}
    assert records[2]["type"] == "complete"
    assert records[2]["payload"]["report"] == {"item_count": 10}
    assert records[2]["payload"]["output_path"] == "generated-123"
    assert records[2]["payload"]["elapsed_seconds"] == 1.25
    assert records[3]["payload"] == {"message": "source missing"}
    assert records[4]["type"] == "cancelled"
