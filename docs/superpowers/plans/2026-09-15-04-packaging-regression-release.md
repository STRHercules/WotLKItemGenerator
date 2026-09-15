# WotLK Item Forge Packaging, Regression & Release Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Package the Python engine and Tauri desktop app into a normal Windows installer while proving GUI/JSON mode preserves generator behavior and adding reproducible release verification.

**Architecture:** Nuitka produces the internal generator sidecar. Tauri `externalBin` bundles that sidecar with an NSIS setup executable. Regression fixtures compare CLI and JSON-mode generated pack artifacts for equivalent configuration, while packaged smoke checks verify a clean Windows user can install/run without Python or development tools.

**Tech Stack:** Python/pytest/Nuitka, PowerShell, Tauri 2 NSIS packaging, Rust/React existing test suites, SHA-256 artifact comparison.

**Spec:** `docs/superpowers/specs/2026-09-15-wotlk-item-forge-desktop-design.md`

## Global Constraints

- Implement after Plans 1–3.
- Primary release artifact is `WotLK Item Forge Setup.exe` / Tauri NSIS `-setup.exe` output.
- End users do not install Python, pip, Node.js, Rust, or Rich.
- Normal GUI launch shows no console window.
- The sidecar is the only executable the Tauri shell capability may spawn.
- CLI and GUI/JSON event mode must produce equivalent generator outputs for equivalent inputs.
- A Linux development environment may verify source/tests, but final NSIS release verification runs on Windows.

---

## File Structure Locked by This Plan

- `engine/build_engine.ps1` — reproducible Nuitka build.
- `engine/requirements-build.txt` — build-only Python dependencies.
- `engine/tests/fixtures/` — small deterministic fixture source set where legally/project-wise available.
- `engine/tests/test_golden_run.py` — CLI/JSON equivalence and golden assertions.
- `scripts/stage-sidecar.ps1` — copy/rename sidecar to Tauri target-triple filename.
- `scripts/windows-smoke.ps1` — packaged smoke checklist automation where possible.
- `src-tauri/binaries/.gitkeep` — sidecar staging directory.
- `src-tauri/tauri.conf.json` — `externalBin`, icons, NSIS bundle settings.
- `src-tauri/capabilities/default.json` — exact sidecar spawn scope.
- `docs/release/windows.md` — build/sign/smoke/release instructions.
- `.github/workflows/windows-build.yml` — optional but recommended repeatable Windows build/test job.

---

### Task 1: Create a Deterministic Small Golden Fixture and Equivalence Harness

**Files:**
- Create: `engine/tests/test_golden_run.py`
- Create: `engine/tests/fixtures/README.md`
- Create fixture files required for the selected smallest valid generation path, copied/generated only from project-owned/test-safe sources.

**Interfaces:**
- Produces helper: `run_engine(mode, fixture_root, output_root, seed, number) -> GeneratedPack`.
- Compares stable artifacts by parsed semantic content or checksum where byte stability is expected.

- [ ] **Step 1: Write the failing equivalence test first**

Run the generator twice with the same seed/config/data, once `--ui plain --quiet` and once `--ui json`, into different output roots. Assert `items.ndjson`, `manifest.csv`, validation summary, and generated DBC/SQL artifacts are semantically/byte equivalent as appropriate.

- [ ] **Step 2: Ensure fixture sources are minimal but valid**

Document exactly which required DBC/SQL fixture inputs are included and why. Do not substitute production behavior with mocks inside the generator for the golden test.

- [ ] **Step 3: Add stable golden expectations**

Record expected item count, validation error count `0`, quality/feature counts, and checksums only for artifacts proven byte-stable across repeated runs on the same supported Python/engine build.

- [ ] **Step 4: Run the test twice**

Run:

```bash
PYTHONPATH=engine python -m pytest engine/tests/test_golden_run.py -v
PYTHONPATH=engine python -m pytest engine/tests/test_golden_run.py -v
```

Expected: PASS both times with identical expected values.

- [ ] **Step 5: Commit**

```bash
git add engine/tests
git commit -m "test(engine): add deterministic CLI and GUI-mode golden regression"
```

---

### Task 2: Build the Generator with Nuitka in Standalone Mode

**Files:**
- Create: `engine/requirements-build.txt`
- Create: `engine/build_engine.ps1`
- Create: `scripts/stage-sidecar.ps1`
- Create: `src-tauri/binaries/.gitkeep`

**Interfaces:**
- Produces Windows sidecar executable `wotlk-item-forge-engine.exe` before Tauri target-triple staging.
- `build_engine.ps1 -Mode Standalone|OneFile` defaults to `Standalone` until resource behavior is verified.

- [ ] **Step 1: Add a build-script contract test/documented dry run**

The script must fail clearly if Python, Nuitka, or required engine source is unavailable and print the output path on success.

- [ ] **Step 2: Pin build-only dependency family**

`requirements-build.txt` includes `Nuitka` and any direct build helper required; runtime generator remains standard-library + optional Rich for CLI development, and the compiled GUI engine must not require Rich.

- [ ] **Step 3: Implement standalone build**

PowerShell invokes `python -m nuitka --standalone` with product/file version metadata, Windows icon when available, and includes `engine/version.py`. Do not bake user data sources into the executable.

- [ ] **Step 4: Implement target-triple sidecar staging**

`stage-sidecar.ps1` copies the built executable to the exact Tauri sidecar naming convention under `src-tauri/binaries/` for `x86_64-pc-windows-msvc`.

- [ ] **Step 5: On Windows, run the compiled CLI help and JSON protocol smoke**

Run:

```powershell
.\engine\build_engine.ps1 -Mode Standalone
.\dist\wotlk-item-forge-engine\wotlk-item-forge-engine.exe --help
```

Then run a tiny fixture generation with `--ui json` and parse every stdout line as JSON.

- [ ] **Step 6: Commit scripts**

```bash
git add engine/requirements-build.txt engine/build_engine.ps1 scripts/stage-sidecar.ps1 src-tauri/binaries/.gitkeep
git commit -m "build(engine): add Nuitka sidecar packaging"
```

---

### Task 3: Configure Tauri External Binary, Capabilities, Icons, and NSIS Bundle

**Files:**
- Modify: `src-tauri/tauri.conf.json`
- Modify: `src-tauri/capabilities/default.json`
- Add: `src-tauri/icons/*` generated from the approved app icon asset when supplied/created
- Create: `docs/release/windows.md`

**Interfaces:**
- `bundle.externalBin` references only `binaries/wotlk-item-forge-engine`.
- NSIS is enabled as the primary Windows bundle target.

- [ ] **Step 1: Add a config validation test/script**

Create a small Node or Rust test that parses `tauri.conf.json` and asserts the external binary path and expected product name/identifier, plus capability scope contains only the engine sidecar for spawn.

- [ ] **Step 2: Configure bundle metadata**

Set product name `WotLK Item Forge`, identifier `com.modernmods.wotlkitemforge`, version aligned with package version, Windows targets including NSIS, externalBin, and app icons.

- [ ] **Step 3: Keep capability least-privilege**

Allow dialog open/save/message, event/core defaults required by the app, and sidecar spawn only. Do not grant arbitrary `cmd` execution or unrestricted shell args from the frontend.

- [ ] **Step 4: Document Windows release build**

`docs/release/windows.md` lists prerequisites for maintainers, engine build/stage, `npm ci`, tests, `npm run tauri build`, output locations, optional signing, and smoke procedure.

- [ ] **Step 5: Run configuration/source tests**

Run: `npm test && npm run build && cargo test --manifest-path src-tauri/Cargo.toml`

- [ ] **Step 6: Commit**

```bash
git add src-tauri docs/release/windows.md
git commit -m "build(windows): configure sidecar and NSIS installer"
```

---

### Task 4: Add Clean-Windows Smoke Verification

**Files:**
- Create: `scripts/windows-smoke.ps1`
- Create/Modify: `docs/release/windows.md`

**Interfaces:**
- Script verifies installed executable presence and basic launch/process behavior; manual checklist covers GUI interactions that cannot be robustly automated without a dedicated Windows UI harness.

- [ ] **Step 1: Write the smoke script to check environment independence**

The script must report whether Python is absent/present but must never rely on it. It launches the installed app, waits for process creation, and verifies no separate console-host window/process is intentionally required by the product.

- [ ] **Step 2: Add the exact manual acceptance checklist**

Checklist:
1. Install app on a clean Windows user profile.
2. Launch without Python installed.
3. Select AzerothCore/Data paths with native dialogs.
4. Confirm Sources health.
5. Generate a tiny fixture/safe test pack.
6. Verify live progress and cancellation on a second run.
7. Verify successful pack is indexed.
8. Open one item in Library.
9. Open Reports and one raw report file.
10. Open History and preload old configuration into Forge without auto-running.
11. Change a fixture source and confirm source-drift warning.
12. Open output folder.
13. Uninstall and verify user-generated pack remains unless explicitly removed by the user.

- [ ] **Step 3: Run smoke on Windows and record release evidence in the release notes/checklist**

No release is tagged until every step passes.

- [ ] **Step 4: Commit**

```bash
git add scripts/windows-smoke.ps1 docs/release/windows.md
git commit -m "test(windows): add packaged application smoke checks"
```

---

### Task 5: Add Repeatable Windows CI Build Verification

**Files:**
- Create: `.github/workflows/windows-build.yml`

**Interfaces:**
- Trigger: pull request/push/manual dispatch.
- Produces test logs and optionally unsigned installer artifacts for internal verification; release publishing remains separate.

- [ ] **Step 1: Create the workflow**

Use `windows-latest`. Steps: checkout, set up Python, Node, Rust stable MSVC, install Python build deps + npm deps, run Python tests, npm tests/build, cargo fmt/clippy/test, Nuitka standalone build, stage sidecar, Tauri build.

- [ ] **Step 2: Upload only non-secret unsigned build artifacts**

Upload the NSIS installer and test logs on successful workflow. Do not add signing credentials to repository files.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/windows-build.yml
git commit -m "ci: verify Windows engine and desktop packaging"
```

---

### Task 6: Final Verification Before Release Claim

**Files:**
- No implementation file required unless verification finds defects.

**Interfaces:**
- Produces evidence that source tests, regression tests, packaging build, and Windows smoke all passed.

- [ ] **Step 1: Run all source-level tests**

```bash
PYTHONPATH=engine python -m pytest engine/tests -v
npm test
npm run build
cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings
cargo test --manifest-path src-tauri/Cargo.toml
```

- [ ] **Step 2: Run Windows packaging pipeline**

```powershell
.\engine\build_engine.ps1 -Mode Standalone
.\scripts\stage-sidecar.ps1
npm run tauri build
```

Expected: NSIS setup executable generated successfully.

- [ ] **Step 3: Run golden regression and packaged smoke**

Golden test passes. Manual clean-Windows checklist passes. Record exact app/engine/protocol/schema versions.

- [ ] **Step 4: Only after evidence is green, tag or describe the build as release-ready**

If any step fails, fix and rerun the failed verification plus directly affected upstream suites before making a completion claim.

---

## Plan 4 Exit Criteria

A Windows user can install the normal setup executable, run the app with no Python/development tools, generate through the compiled sidecar, browse successful results, and uninstall safely. CLI and JSON-mode golden tests establish generator-behavior compatibility.
