# Windows Release Guide

WotLK Item Forge is packaged as a Tauri 2 desktop application with a Nuitka-compiled Python generator sidecar. End users install one normal NSIS setup executable and do not need Python, Node.js, Rust, Rich, or developer tools.

## Release architecture

- Tauri/React provides the desktop UI.
- Rust owns sidecar launch, cancellation, SQLite, filesystem-safe open actions, and native integration.
- Nuitka compiles `engine/generate_pack.py` into `wotlk-item-forge-engine.exe`.
- The release bundle stages the engine as `src-tauri/binaries/wotlk-item-forge-engine-x86_64-pc-windows-msvc.exe`.
- `bundle.externalBin` references `binaries/wotlk-item-forge-engine`, so Tauri selects the target-triple-suffixed file at build time.
- The webview has no shell process permission. The sidecar is launched only through the typed Rust `start_generation` command.

## Maintainer prerequisites

Use a 64-bit Windows build machine with:

1. Git.
2. A supported 64-bit CPython installation available as `python`.
3. Node.js 20 or newer with npm.
4. Rust stable with the `x86_64-pc-windows-msvc` host/target.
5. Microsoft Visual Studio Build Tools with the Desktop development with C++ workload.
6. WebView2 tooling/runtime as required by Tauri 2.

Tauri/NSIS helper tools may be downloaded by the Tauri CLI during bundling.


## One-command verification + installer build

After installing the maintainer dependencies below, the canonical release command is:

```powershell
.\scripts\build-windows-release.ps1
```

That command runs the Python, frontend, Tauri-config, Rust formatting/clippy/test checks, builds a Nuitka Standalone engine for smoke verification, stages the OneFile sidecar, builds the NSIS installer, and writes `dist\release-evidence\release-manifest.json`. The manifest records app/engine/protocol/schema versions, the Git commit, toolchain versions, installer size, and installer SHA-256. GitHub Actions calls this same script so the CI and local release paths stay aligned.

Use `-SkipVerification` or `-SkipStandaloneSmoke` only for local diagnosis. Neither switch is appropriate for release evidence.

## 1. Install dependencies

From the repository root in PowerShell:

```powershell
python -m pip install -r .\engine\requirements-build.txt
npm install
rustup target add x86_64-pc-windows-msvc
```

The repository currently has no committed npm lockfile, so use `npm install` rather than `npm ci`. The Windows build retains the generated `package-lock.json` and `src-tauri\Cargo.lock` alongside the release manifest so the exact resolved dependency graphs for that installer are auditable.

## 2. Run source verification

```powershell
$env:PYTHONPATH = 'engine'
python -m pytest .\engine\tests -v
npm test
npm run build
npm run check:tauri-config
cargo fmt --manifest-path .\src-tauri\Cargo.toml -- --check
cargo clippy --manifest-path .\src-tauri\Cargo.toml -- -D warnings
cargo test --manifest-path .\src-tauri\Cargo.toml
```

The golden CLI-vs-JSON regression is enabled when `WOTLK_FIXTURE_DATA` points to the legal test source set described in `engine/tests/fixtures/README.md`. Without that external fixture it is expected to report `SKIPPED`, not `PASSED`.

## 3. Build and test the engine

First build Standalone mode because missing runtime files are easiest to diagnose there:

```powershell
.\engine\build_engine.ps1 -Mode Standalone -Clean
```

Locate the printed executable path and verify:

```powershell
& '<printed-standalone-exe>' --help
```

If `WOTLK_FIXTURE_DATA` is configured, run the golden test now:

```powershell
$env:PYTHONPATH = 'engine'
python -m pytest .\engine\tests\test_golden_run.py -v
```

For the Tauri bundle, create and stage the OneFile engine. Tauri `externalBin` embeds one executable, while a Nuitka Standalone build requires the rest of its `.dist` directory alongside it.

```powershell
.\scripts\stage-sidecar.ps1 -BuildOneFile
```

The staged output must be:

```text
src-tauri\binaries\wotlk-item-forge-engine-x86_64-pc-windows-msvc.exe
```

The engine uses Nuitka `--windows-console-mode=attach`. This preserves inherited stdout/stderr pipes for the JSON protocol without forcing a new console window when launched from the GUI.

## 4. Build the Windows installer

```powershell
npm run tauri build
```

The primary artifact is the NSIS setup executable under Tauri's target release bundle directory, normally similar to:

```text
src-tauri\target\release\bundle\nsis\WotLK Item Forge_0.1.0_x64-setup.exe
```

Exact filename punctuation is controlled by the Tauri bundler.

## 5. Signing

Unsigned installers are suitable for internal verification. For public distribution, sign the final application/installer using your normal Windows code-signing process. Never store private signing keys, certificates, or passwords in the repository.

The GitHub Actions workflow intentionally creates unsigned verification artifacts only.

## 6. Packaged smoke test

Run:

```powershell
.\scripts\windows-smoke.ps1 -AppPath 'C:\Path\To\WotLK Item Forge.exe'
```

Then complete the manual acceptance checklist documented below. Do not call a build release-ready until the source suites, engine build, Tauri bundle, and clean-user smoke checks are all green.

### Manual acceptance checklist

- [ ] Install on a clean Windows user profile.
- [ ] Launch successfully with no Python installation required.
- [ ] Select AzerothCore/Data paths through native dialogs.
- [ ] Confirm the Sources health screen correctly identifies required and optional inputs.
- [ ] Generate a small safe test pack and observe live phase/class progress.
- [ ] Start a second run, cancel it, and confirm History records `cancelled` rather than `failed`.
- [ ] Confirm a successful pack is indexed into Library.
- [ ] Open one generated item and inspect Pretty and Raw Data views.
- [ ] Open Reports and open one indexed raw report file in the operating system.
- [ ] Open History and use Regenerate; verify Forge is preloaded but does not auto-run.
- [ ] Change one fixture source and confirm History reports source drift.
- [ ] Open the generated output folder from the app.
- [ ] Uninstall and verify user-generated pack output remains untouched.

## Data and licensing note

The app does not bundle Blizzard client DBC files or a production AzerothCore database dump. Users select or provide their own valid source data. The external golden fixture path follows the same rule.

## App icon

No approved branded application icon asset is included in this repository snapshot, so Tauri's default application icon behavior is retained. When an approved icon asset is added, generate Tauri's Windows icon set from that asset before a branded public release.
