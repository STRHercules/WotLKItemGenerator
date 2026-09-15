from pathlib import Path


ROOT = Path(__file__).resolve().parents[2]


def test_windows_ci_uses_canonical_release_script_and_uploads_installer() -> None:
    workflow = ROOT / '.github' / 'workflows' / 'windows-build.yml'
    assert workflow.is_file()
    text = workflow.read_text(encoding='utf-8')
    assert 'windows-latest' in text
    assert 'python -m pip install -r engine/requirements-build.txt' in text
    assert 'npm install' in text
    assert '.\\scripts\\build-windows-release.ps1' in text
    assert 'upload-artifact@v4' in text
    assert 'bundle/nsis' in text
    assert 'dist/release-evidence/release-manifest.json' in text
    assert 'package-lock.json' in text
    assert 'src-tauri/Cargo.lock' in text
    # Release verification should live in one PowerShell entry point, not drift
    # as a second independent set of build/test commands inside the workflow.
    assert 'npm run tauri build' not in text
    assert 'stage-sidecar.ps1 -BuildOneFile' not in text
