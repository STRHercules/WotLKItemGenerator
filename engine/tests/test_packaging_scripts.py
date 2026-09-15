from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]


def test_nuitka_build_script_contract() -> None:
    script = ROOT / "engine" / "build_engine.ps1"
    assert script.is_file()
    text = script.read_text(encoding="utf-8")
    assert "param(" in text
    assert "Standalone" in text and "OneFile" in text
    assert "python -m nuitka" in text.lower()
    assert "--mode=standalone" in text
    assert "--mode=onefile" in text
    assert "--output-filename=wotlk-item-forge-engine.exe" in text
    assert "--windows-console-mode=attach" in text
    assert "Write-Output" in text


def test_stage_sidecar_targets_tauri_triple_name() -> None:
    script = ROOT / "scripts" / "stage-sidecar.ps1"
    assert script.is_file()
    text = script.read_text(encoding="utf-8")
    assert "x86_64-pc-windows-msvc" in text
    assert "wotlk-item-forge-engine-x86_64-pc-windows-msvc.exe" in text
    assert "src-tauri" in text
    assert "binaries" in text


def test_build_requirements_pin_nuitka_family() -> None:
    requirements = (ROOT / "engine" / "requirements-build.txt").read_text(encoding="utf-8")
    assert "Nuitka" in requirements


def test_windows_smoke_script_does_not_depend_on_python() -> None:
    script = ROOT / "scripts" / "windows-smoke.ps1"
    assert script.is_file()
    text = script.read_text(encoding="utf-8")
    assert "Get-Command python" in text
    assert "Start-Process" in text
    assert "Get-Process" in text
    assert "Python is not required" in text
    assert "manual acceptance" in text.lower()


def test_one_command_windows_release_script_contract() -> None:
    script = ROOT / "scripts" / "build-windows-release.ps1"
    assert script.is_file()
    text = script.read_text(encoding="utf-8")
    assert "python -m pytest engine/tests" in text
    assert "npm test" in text
    assert "npm run build" in text
    assert "cargo fmt" in text
    assert "cargo clippy" in text
    assert "cargo test" in text
    assert "build_engine.ps1 -Mode Standalone" in text
    assert "stage-sidecar.ps1 -BuildOneFile" in text
    assert "npm run tauri build" in text
    assert "bundle\\nsis" in text
    assert "Write-Output" in text


def test_release_manifest_script_records_versions_and_installer_hash() -> None:
    script = ROOT / "scripts" / "write-release-manifest.ps1"
    assert script.is_file()
    text = script.read_text(encoding="utf-8")
    for required in (
        "GENERATOR_VERSION",
        "EVENT_PROTOCOL_VERSION",
        "CACHE_SCHEMA_VERSION",
        "SCHEMA_VERSION",
        "Get-FileHash",
        "git rev-parse HEAD",
        "rustc --version",
        "cargo --version",
        "node --version",
        "npm --version",
        "python --version",
        "release-manifest.json",
        "package-lock.json",
        "src-tauri\\Cargo.lock",
        "dependencyLocks",
    ):
        assert required in text


def test_release_builder_writes_release_manifest() -> None:
    script = (ROOT / "scripts" / "build-windows-release.ps1").read_text(encoding="utf-8")
    assert "write-release-manifest.ps1" in script
