from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def test_intentional_sidecar_cancellation_is_not_reclassified_as_failure() -> None:
    process = (ROOT / 'src-tauri/src/engine/process.rs').read_text(encoding='utf-8')
    command = (ROOT / 'src-tauri/src/commands/engine.rs').read_text(encoding='utf-8')
    assert 'cancelled:' in process
    assert 'mark_cancelled' in process
    assert 'take_cancelled' in process
    assert 'let was_cancelled = registry_for_task.take_cancelled(&run_for_task)' in command
    assert '&& !was_cancelled' in command
