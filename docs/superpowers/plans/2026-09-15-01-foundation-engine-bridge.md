# WotLK Item Forge Foundation & Engine Bridge Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a runnable Tauri 2 + React desktop shell and adapt the existing Python generator into a CLI-compatible JSON-event sidecar with explicit output/resource paths.

**Architecture:** The existing Python generator remains authoritative. A new JSON UI adapter emits newline-delimited protocol events, while the Tauri Rust backend owns process lifecycle and forwards parsed events to the React frontend. The CLI and Rich terminal modes remain available and generation formulas are not duplicated.

**Tech Stack:** Python 3.11+, pytest, Nuitka later in packaging; Tauri 2, Rust, serde/serde_json, tauri-plugin-shell, tauri-plugin-dialog; React 18+, TypeScript, Vite, Vitest, React Testing Library.

**Spec:** `docs/superpowers/specs/2026-09-15-wotlk-item-forge-desktop-design.md`

## Global Constraints

- Target Windows 10/11 x64.
- Keep the Python generator as the authoritative generation engine.
- Preserve CLI operation and deterministic output.
- Use newline-delimited JSON on stdout only in GUI/JSON mode; stderr remains diagnostic.
- Do not reimplement generator formulas, DBC logic, loot logic, naming logic, or validation in Rust/TypeScript.
- User-writable output/state must not depend on the install directory.
- Event protocol, generator engine, app, database schema, and cache schema have independent versions.
- Version 1 does not edit generated items or import directly into a live AzerothCore database.

---

## File Structure Locked by This Plan

- `engine/generate_pack.py` — maintained copy of the supplied generator.
- `engine/version.py` — generator version/build identity and protocol constants.
- `engine/tests/test_output_paths.py` — output/resource path behavior.
- `engine/tests/test_json_ui.py` — JSON event protocol behavior.
- `engine/tests/test_cli_compatibility.py` — terminal/JSON argument compatibility.
- `package.json` — frontend/Tauri scripts and dependencies.
- `src/main.tsx` — React entry point.
- `src/App.tsx` — initial application shell placeholder.
- `src/types/engine.ts` — shared TypeScript event/config types.
- `src/lib/engineEvents.ts` — event validation/normalization.
- `src/lib/__tests__/engineEvents.test.ts` — frontend protocol parser tests.
- `src-tauri/Cargo.toml` — Tauri/Rust dependencies.
- `src-tauri/tauri.conf.json` — desktop/bundle configuration.
- `src-tauri/capabilities/default.json` — least-privilege Tauri permissions.
- `src-tauri/src/main.rs` — binary entry point.
- `src-tauri/src/lib.rs` — Tauri builder/plugin registration.
- `src-tauri/src/engine/events.rs` — Rust event model and parser.
- `src-tauri/src/engine/process.rs` — child process ownership and cancellation.
- `src-tauri/src/engine/mod.rs` — engine module exports.
- `src-tauri/src/commands/engine.rs` — start/cancel/query Tauri commands.
- `src-tauri/src/commands/mod.rs` — command exports.

---

### Task 1: Scaffold the Tauri/React/Test Harness

**Files:**
- Create: `package.json`
- Create: `index.html`
- Create: `tsconfig.json`
- Create: `vite.config.ts`
- Create: `src/main.tsx`
- Create: `src/App.tsx`
- Create: `src/test/setup.ts`
- Create: `src/App.test.tsx`
- Create: `src-tauri/Cargo.toml`
- Create: `src-tauri/build.rs`
- Create: `src-tauri/tauri.conf.json`
- Create: `src-tauri/src/main.rs`
- Create: `src-tauri/src/lib.rs`
- Create: `src-tauri/capabilities/default.json`
- Create: `.gitignore`

**Interfaces:**
- Produces: `npm run test`, `npm run build`, `npm run tauri dev`, and `cargo test --manifest-path src-tauri/Cargo.toml` as stable project commands.
- Produces: a Tauri app named `WotLK Item Forge` with bundle identifier `com.modernmods.wotlkitemforge`.

- [ ] **Step 1: Write the failing React smoke test**

```tsx
// src/App.test.tsx
import { render, screen } from '@testing-library/react';
import { describe, expect, it } from 'vitest';
import App from './App';

describe('App', () => {
  it('renders the application identity', () => {
    render(<App />);
    expect(screen.getByRole('heading', { name: /wotlk item forge/i })).toBeInTheDocument();
  });
});
```

- [ ] **Step 2: Add package/test configuration and verify the test fails because the app does not exist yet**

Use this `package.json` baseline:

```json
{
  "name": "wotlk-item-forge",
  "private": true,
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "tsc -b && vite build",
    "test": "vitest run",
    "test:watch": "vitest",
    "tauri": "tauri"
  },
  "dependencies": {
    "@tauri-apps/api": "^2",
    "@tauri-apps/plugin-dialog": "^2",
    "@tauri-apps/plugin-shell": "^2",
    "react": "^18",
    "react-dom": "^18"
  },
  "devDependencies": {
    "@tauri-apps/cli": "^2",
    "@testing-library/jest-dom": "^6",
    "@testing-library/react": "^16",
    "@types/react": "^18",
    "@types/react-dom": "^18",
    "@vitejs/plugin-react": "^4",
    "jsdom": "^26",
    "typescript": "^5",
    "vite": "^6",
    "vitest": "^3"
  }
}
```

Run: `npm install && npm test`

Expected: FAIL until `src/App.tsx` and test setup are created.

- [ ] **Step 3: Implement the minimal React shell**

```tsx
// src/App.tsx
export default function App() {
  return (
    <main>
      <h1>WotLK Item Forge</h1>
      <p>AzerothCore • WotLK 3.3.5a</p>
    </main>
  );
}
```

Create `src/main.tsx` with `createRoot`, and configure Vitest with `environment: 'jsdom'` plus `src/test/setup.ts` importing `@testing-library/jest-dom/vitest`.

- [ ] **Step 4: Add the minimal Tauri 2 Rust shell**

Use `tauri`, `tauri-plugin-shell`, `tauri-plugin-dialog`, `serde`, and `serde_json`. `src-tauri/src/lib.rs` must initialize shell and dialog plugins and invoke no application commands yet.

- [ ] **Step 5: Run the complete scaffold checks**

Run:

```bash
npm test
npm run build
cargo test --manifest-path src-tauri/Cargo.toml
cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
```

Expected: all PASS.

- [ ] **Step 6: Commit**

```bash
git add package.json package-lock.json index.html tsconfig.json vite.config.ts src src-tauri .gitignore
git commit -m "chore: scaffold WotLK Item Forge desktop app"
```

---

### Task 2: Import the Generator and Decouple Installed Paths

**Files:**
- Create: `engine/generate_pack.py` from the supplied `generate_pack(20260915-210147).py`
- Create: `engine/version.py`
- Create: `engine/tests/test_output_paths.py`
- Modify: `engine/generate_pack.py` path/configuration section and argument parser

**Interfaces:**
- Produces: `--output-root PATH` and `--data-dir PATH` CLI arguments.
- Produces: `GENERATOR_VERSION`, `ENGINE_BUILD_ID`, `EVENT_PROTOCOL_VERSION`, `CACHE_SCHEMA_VERSION` from `engine/version.py`.
- Preserves: no-argument interactive CLI behavior and existing generator options.

- [ ] **Step 1: Copy the supplied generator verbatim into `engine/generate_pack.py` and record its SHA-256 in the commit message/body**

Run:

```bash
cp /mnt/data/generate_pack\(20260915-210147\).py engine/generate_pack.py
sha256sum engine/generate_pack.py
```

- [ ] **Step 2: Write failing path tests**

```python
# engine/tests/test_output_paths.py
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
```

Run: `python -m pytest engine/tests/test_output_paths.py -v`

Expected: FAIL because the arguments do not exist.

- [ ] **Step 3: Add explicit version/build constants**

```python
# engine/version.py
GENERATOR_VERSION = "0.1.0"
ENGINE_BUILD_ID = "dev"
EVENT_PROTOCOL_VERSION = 1
CACHE_SCHEMA_VERSION = 2
```

In `generate_pack.py`, import these constants instead of hard-coding cache schema `1`.

- [ ] **Step 4: Add `--output-root` and `--data-dir` without changing generation formulas**

`parse_args()` must add:

```python
parser.add_argument('--output-root', type=Path, default=None, metavar='PATH')
parser.add_argument('--data-dir', type=Path, default=None, metavar='PATH')
```

At runtime, resolve `data_dir` from the explicit argument when present, otherwise retain the existing `ROOT / 'Data'` behavior. Resolve `OUT` to `(output_root or ROOT) / f'generated-{SEED}'`.

- [ ] **Step 5: Replace the loose-script cache hash with engine identity**

Replace the `ROOT/'generate_pack.py'` hash field with:

```python
'generator': f'{GENERATOR_VERSION}:{ENGINE_BUILD_ID}',
```

Keep source file size/mtime fingerprints and all other cache key fields intact.

- [ ] **Step 6: Run path and parser regression tests**

Run:

```bash
python -m pytest engine/tests/test_output_paths.py -v
python engine/generate_pack.py --help > /tmp/wotlk-help.txt
grep -q -- '--output-root' /tmp/wotlk-help.txt
grep -q -- '--data-dir' /tmp/wotlk-help.txt
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add engine
git commit -m "feat(engine): support desktop-safe output and data paths"
```

---

### Task 3: Add the Versioned JSON Event Protocol

**Files:**
- Create: `engine/tests/test_json_ui.py`
- Modify: `engine/generate_pack.py` UI mode definitions and UI factory
- Create: `src/types/engine.ts`
- Create: `src/lib/engineEvents.ts`
- Create: `src/lib/__tests__/engineEvents.test.ts`

**Interfaces:**
- Produces Python class: `JsonEventUI(stream=None)` implementing the same callback surface as terminal UIs.
- Produces CLI mode: `--ui json`.
- Produces JSON lines with required field `protocol_version: 1` and `type` values `configured`, `phase`, `progress`, `status`, `discovery`, `source_check`, `validation`, `complete`, `error`.
- Produces TypeScript discriminated union `EngineEvent` and `parseEngineEvent(line: string): EngineEvent`.

- [ ] **Step 1: Write failing Python protocol tests**

```python
# engine/tests/test_json_ui.py
import io
import json
from generate_pack import JsonEventUI


def one_event(callback):
    stream = io.StringIO()
    ui = JsonEventUI(stream=stream)
    callback(ui)
    lines = [line for line in stream.getvalue().splitlines() if line]
    assert len(lines) == 1
    return json.loads(lines[0])


def test_progress_event_is_ndjson():
    event = one_event(lambda ui: ui.progress(2, 10, current="Mage", class_name="Mage", class_completed=2, class_total=3))
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
    event = one_event(lambda ui: ui.validation(["bad item"], [{"entry": 1, "old_name": "A", "new_name": "B"}]))
    assert event["type"] == "validation"
    assert event["error_count"] == 1
    assert event["name_repair_count"] == 1
```

Run: `PYTHONPATH=engine python -m pytest engine/tests/test_json_ui.py -v`

Expected: FAIL because `JsonEventUI` is not defined.

- [ ] **Step 2: Implement a minimal `JsonEventUI` adapter**

Implement `_emit(type_, **payload)` using `json.dumps(..., separators=(',', ':'), ensure_ascii=False)` and `flush=True`. Each existing UI callback emits exactly one semantic event. `item()` reuses `notable_item_event()` and emits a `discovery` event only when notable.

`complete()` emits the report summary instead of terminal formatting. `error()` emits structured JSON to stdout in JSON mode and the traceback/diagnostic may still go to stderr from the caller.

- [ ] **Step 3: Extend UI mode resolution and factory**

Change `UI_MODES` to include `json`. `resolve_ui_mode('json')` returns `json` regardless of TTY/Rich. `create_terminal_ui()` returns `JsonEventUI` for JSON mode.

- [ ] **Step 4: Write failing TypeScript parser tests**

```ts
// src/lib/__tests__/engineEvents.test.ts
import { describe, expect, it } from 'vitest';
import { parseEngineEvent } from '../engineEvents';

describe('parseEngineEvent', () => {
  it('accepts protocol v1 progress events', () => {
    const event = parseEngineEvent('{"protocol_version":1,"type":"progress","completed":1,"total":2}');
    expect(event.type).toBe('progress');
  });

  it('rejects incompatible protocols', () => {
    expect(() => parseEngineEvent('{"protocol_version":2,"type":"status","message":"x"}')).toThrow(/protocol/i);
  });
});
```

Run: `npm test -- src/lib/__tests__/engineEvents.test.ts`

Expected: FAIL because the parser/types do not exist.

- [ ] **Step 5: Implement TypeScript engine event types and parser**

Define `EngineEvent` as a discriminated union with `protocol_version: 1`. `parseEngineEvent` parses JSON, verifies object shape, protocol version, and known `type`, then returns the typed object. Unknown event types must throw an explicit error.

- [ ] **Step 6: Run protocol tests**

Run:

```bash
PYTHONPATH=engine python -m pytest engine/tests/test_json_ui.py -v
npm test -- src/lib/__tests__/engineEvents.test.ts
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add engine src/types src/lib
git commit -m "feat(engine): add versioned JSON event protocol"
```

---

### Task 4: Add the Rust Engine Process Supervisor

**Files:**
- Create: `src-tauri/src/engine/events.rs`
- Create: `src-tauri/src/engine/process.rs`
- Create: `src-tauri/src/engine/mod.rs`
- Create: `src-tauri/src/commands/engine.rs`
- Create: `src-tauri/src/commands/mod.rs`
- Modify: `src-tauri/src/lib.rs`
- Modify: `src-tauri/Cargo.toml`

**Interfaces:**
- Produces command: `start_generation(request: GenerationRequest) -> Result<RunHandle, String>`.
- Produces command: `cancel_generation(run_id: String) -> Result<(), String>`.
- Emits Tauri events on channel `engine://event` with envelope `{ run_id, event }`.
- Emits diagnostics on channel `engine://stderr` with `{ run_id, line }`.
- Enforces one active engine process per `run_id`; rejects duplicate active IDs.

- [ ] **Step 1: Write failing Rust parser/supervisor state tests**

In `src-tauri/src/engine/events.rs` add tests that deserialize protocol v1 events and reject protocol v2. In `process.rs`, add a pure `ProcessRegistry` test proving insert, duplicate rejection, removal, and cancellation lookup behavior without launching a real child.

Run: `cargo test --manifest-path src-tauri/Cargo.toml engine::`

Expected: FAIL until modules exist.

- [ ] **Step 2: Implement Rust protocol models**

Use serde-tagged enums:

```rust
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "type", rename_all = "snake_case")]
pub enum EngineEvent {
    Configured { protocol_version: u32, seed: String, number: u64, /* remaining payload as typed/Value fields */ },
    Phase { protocol_version: u32, name: String, detail: String, total: Option<u64> },
    Progress { protocol_version: u32, completed: u64, total: u64, current: Option<String>, class_name: Option<String>, class_completed: Option<u64>, class_total: Option<u64> },
    Status { protocol_version: u32, message: String },
    Discovery { protocol_version: u32, kind: String, title: String, detail: String },
    SourceCheck { protocol_version: u32, label: String, path: String, ok: bool },
    Validation { protocol_version: u32, error_count: usize, errors: Vec<String>, name_repair_count: usize, name_repairs: serde_json::Value },
    Complete { protocol_version: u32, report: serde_json::Value, elapsed: f64, output_dir: String },
    Error { protocol_version: u32, stage: Option<String>, message: String, details: Option<serde_json::Value> },
}
```

Add `parse_event_line` that refuses any event whose `protocol_version != 1`.

- [ ] **Step 3: Implement process registry and child lifecycle**

Use `Arc<Mutex<HashMap<String, CommandChild>>>` inside managed Tauri state. `start_generation` builds only the bundled sidecar command, passes arguments built from `GenerationRequest`, spawns it, parses stdout line-by-line, emits typed events, and forwards stderr to diagnostics. On exit it removes the child from the registry.

- [ ] **Step 4: Restrict shell capability to the bundled sidecar**

`src-tauri/capabilities/default.json` must grant `shell:allow-spawn` only for the configured sidecar name and must not grant arbitrary system command execution. Dialog permissions may allow open/save/message only.

- [ ] **Step 5: Register Tauri commands and plugins**

`lib.rs` initializes dialog/shell plugins, manages `ProcessRegistry`, and registers `start_generation` plus `cancel_generation` with `generate_handler!`.

- [ ] **Step 6: Run Rust tests and lints**

Run:

```bash
cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings
cargo test --manifest-path src-tauri/Cargo.toml
```

Expected: PASS.

- [ ] **Step 7: Commit**

```bash
git add src-tauri
git commit -m "feat(desktop): supervise generator sidecar and stream events"
```

---

### Task 5: Add the Frontend Engine Client and Run-State Reducer

**Files:**
- Create: `src/lib/tauriEngine.ts`
- Create: `src/features/forge/runState.ts`
- Create: `src/features/forge/runState.test.ts`
- Modify: `src/types/engine.ts`

**Interfaces:**
- Produces: `startGeneration(request): Promise<RunHandle>` and `cancelGeneration(runId): Promise<void>`.
- Produces: `subscribeEngineEvents(runId, onEvent): Promise<UnlistenFn>`.
- Produces: `reduceRunState(state, event): RunState` with lifecycle states from the spec.

- [ ] **Step 1: Write failing lifecycle reducer tests**

Test `phase` events map to `checking_sources/configuring/generating_skeletons/finalizing_items/validating/writing_output`; `complete` maps to `complete`; structured `error` maps to `failed`; explicit cancel action maps to `cancelled`; per-class progress updates only the matching class.

Run: `npm test -- src/features/forge/runState.test.ts`

Expected: FAIL.

- [ ] **Step 2: Implement the run-state reducer**

Keep the reducer pure. Store phase name/detail, overall progress, class progress map, discoveries capped to the newest 50, validation result, completion summary, and error state.

- [ ] **Step 3: Implement the Tauri engine client**

Use `invoke` for start/cancel and `listen` for `engine://event` plus `engine://stderr`. Filter every incoming event by `run_id` before passing it to the caller.

- [ ] **Step 4: Run frontend tests**

Run: `npm test`

Expected: PASS.

- [ ] **Step 5: Commit**

```bash
git add src
git commit -m "feat(forge): add desktop engine client and run state"
```

---

## Plan 1 Exit Criteria

Before moving to Plan 2:

```bash
PYTHONPATH=engine python -m pytest engine/tests -v
npm test
npm run build
cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings
cargo test --manifest-path src-tauri/Cargo.toml
```

All checks pass. The generator still runs as a CLI, `--ui json` emits versioned NDJSON, output/data paths are install-safe, and the Tauri backend can own/cancel a sidecar process and forward structured events.
