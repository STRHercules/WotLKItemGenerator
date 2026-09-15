import io
import json

import generate_pack as gp


def test_json_line_ui_emits_one_json_object_per_line():
    stream = io.StringIO()
    ui = gp.JsonLineUI(stream=stream)
    ui.phase("Generating item skeletons", total=100, detail="test")
    event = json.loads(stream.getvalue().strip())
    assert event["type"] == "phase"
    assert event["payload"]["total"] == 100
    assert stream.getvalue().endswith("\n")
