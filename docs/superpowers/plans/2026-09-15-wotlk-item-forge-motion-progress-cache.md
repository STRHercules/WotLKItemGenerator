# WotLK Item Forge Motion, Progress, and Cache Refresh Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add subtle technical motion, correct phase progress resets, reduce repeated source-preparation cost, synchronize the release to `0.1.1`, and produce a fresh verified Windows installer.

**Architecture:** Keep React/CSS responsible for presentation, keep the Python generator authoritative, and keep Tauri/Rust responsible for process supervision and local storage. Reuse the existing persisted Python source catalog cache, removing redundant source-tree traversal and exposing cache timing through the existing JSONL status/configured event path.

**Tech Stack:** React 18, TypeScript, CSS, Vite/Vitest, Python/pytest, JSONL, Tauri 2, Rust, Nuitka, PowerShell, NSIS.

**Spec:** `docs/superpowers/specs/2026-09-15-wotlk-item-forge-motion-progress-cache-design.md`

## Global Constraints

- Use CSS-only visual motion; do not add a canvas, particle engine, animation dependency, or rendering loop.
- Preserve the existing deep navy/technical grid visual system and all current UI contracts.
- Honor persisted Reduce Motion and `prefers-reduced-motion`.
- Keep Python as the generation authority and preserve JSONL protocol version `1`.
- Preserve source-cache invalidation by engine identity, cache schema, source root, relevant options, and source metadata.
- Do not change item formulas, selection, weights, loot algorithms, or output formats.
- Bump app/generator/Rust versions from `0.1.0` to `0.1.1`; keep cache serialization schema `2` and event protocol `1`.
- Do not commit or discard unrelated existing worktree changes; preserve the shared dirty checkout.

## File Map

- `src/features/forge/runState.ts` — reset phase-local class progress while preserving totals.
- `src/features/forge/runState.test.ts` / `runState.node-test.ts` — reducer regression coverage.
- `src/features/forge/ForgeLive.tsx` / `forge.css` — phase data attributes, active progress animation, discovery transitions, and reduced-motion behavior.
- `src/styles/global.css` — subtle animated grid/glow background.
- `engine/generate_pack.py` — source-cache traversal optimization and cache timing/status metadata.
- `engine/tests/test_output_paths.py` / `test_json_ui.py` — cache and JSON contract coverage.
- `src/types/engine.ts` / `src-tauri/src/engine/events.rs` — optional cache metadata at the existing configured-event boundary.
- `src-tauri/src/commands/engine.rs` — forward the bounded configured-event cache metadata without changing subprocess ownership.
- `package.json`, `package-lock.json`, `src-tauri/Cargo.toml`, `src-tauri/Cargo.lock`, `src-tauri/tauri.conf.json`, `engine/version.py` — coordinated `0.1.1` version bump and engine identity.
- `scripts/write-release-manifest.ps1` — existing release evidence path; verify it records `0.1.1`.

---

### Task 1: Add failing progress-reset regression tests

**Files:**
- Modify: `src/features/forge/runState.test.ts`
- Modify: `src/features/forge/runState.node-test.ts`
- Reference: `src/features/forge/runState.ts`

**Interfaces:**
- Consumes: `initialRunState()` and `reduceRunState(state, action)`.
- Produces: a regression contract that phase transitions preserve class totals but reset completed values.

- [ ] **Step 1: Add the failing Vitest case**

Add a test that seeds `Mage` and `Druid` at completion, dispatches a `phase` event named `Finalizing generated items` with `total: 100`, and asserts:

```ts
expect(next.progress).toEqual({ completed: 0, total: 100, current: '' });
expect(next.classProgress).toEqual({
  Mage: { completed: 0, total: 10 },
  Druid: { completed: 0, total: 10 },
});
```

- [ ] **Step 2: Run the focused test and verify it fails**

Run:

```powershell
npm test -- --run src/features/forge/runState.test.ts
```

Expected: FAIL because the current `phase` reducer preserves completed class values.

- [ ] **Step 3: Add the equivalent dependency-free Node assertion**

Extend `src/features/forge/runState.node-test.ts` with the same phase transition and assertions so the reducer contract is runnable without Vitest.

- [ ] **Step 4: Run both focused tests**

Run:

```powershell
npm test -- --run src/features/forge/runState.test.ts
node --experimental-strip-types --test src/features/forge/runState.node-test.ts
```

Expected: the new assertions fail while the pre-existing reducer assertions pass.

---

### Task 2: Implement phase-local progress reset

**Files:**
- Modify: `src/features/forge/runState.ts`
- Test: `src/features/forge/runState.test.ts`
- Test: `src/features/forge/runState.node-test.ts`

**Interfaces:**
- Consumes: `RunLifecycle`, `RunState.classProgress`, and existing `phase` events.
- Produces: `reduceRunState` behavior that preserves totals and resets completions for `generating_skeletons` and `finalizing_items`.

- [ ] **Step 1: Implement the smallest reducer change**

In the `phase` case, derive the lifecycle with `lifecycleForPhase(action.name)`. When it is `generating_skeletons` or `finalizing_items`, rebuild `classProgress` with the existing class keys and totals and `completed: 0`; otherwise preserve the existing map.

Keep the existing overall reset:

```ts
progress: { completed: 0, total: action.total ?? 0, current: '' }
```

- [ ] **Step 2: Run the focused tests and verify green**

Run:

```powershell
npm test -- --run src/features/forge/runState.test.ts
node --experimental-strip-types --test src/features/forge/runState.node-test.ts
```

Expected: all focused assertions pass.

- [ ] **Step 3: Run the full frontend test suite**

Run:

```powershell
npm test -- --run
```

Expected: all existing frontend tests pass.

---

### Task 3: Add subtle Forge motion and phase styling

**Files:**
- Modify: `src/styles/global.css`
- Modify: `src/features/forge/ForgeLive.tsx`
- Modify: `src/features/forge/forge.css`
- Test: `src/features/forge/ForgeLive.test.tsx`

**Interfaces:**
- Consumes: `RunState.lifecycle`, `RunState.phaseName`, existing CSS variables, and the existing `data-reduce-motion` root attribute.
- Produces: a visual-only phase surface with no new runtime loop or dependency.

- [ ] **Step 1: Add a failing ForgeLive phase-attribute assertion**

Render `ForgeLive` with `lifecycle: 'finalizing_items'` and assert the root live grid exposes a stable phase attribute:

```ts
expect(screen.getByTestId('live-forge')).toHaveAttribute('data-phase', 'finalizing_items');
```

Add the `data-testid` only to this existing live root; do not create a new component abstraction.

- [ ] **Step 2: Run the focused test and verify it fails**

Run:

```powershell
npm test -- --run src/features/forge/ForgeLive.test.tsx
```

- [ ] **Step 3: Add the phase attribute and semantic animation hooks**

Set `data-phase={state.lifecycle}` and add the existing phase/status classes needed for CSS selectors. Keep the DOM compact: one active sheen layer on `.progress-track`, one phase indicator element if needed, and the current discovery cards.

- [ ] **Step 4: Add CSS-only motion**

Implement these keyframes in the existing CSS files:

```css
@keyframes forge-grid-drift { /* long, low-opacity background movement */ }
@keyframes forge-progress-sheen { /* translate/opacity only */ }
@keyframes forge-discovery-in { /* opacity/translate only */ }
```

Apply them with long durations and low opacity. Add the same selectors under the existing reduced-motion rules with animation disabled. Keep completed bars static and animate only the active `.live-main-panel`/progress surface.

- [ ] **Step 5: Run focused and full frontend verification**

Run:

```powershell
npm test -- --run src/features/forge/ForgeLive.test.tsx
npm test -- --run
npm run build
```

Expected: all tests and the production build pass.

---

### Task 4: Fix redundant source-cache traversal and expose cache timing

**Files:**
- Modify: `engine/generate_pack.py`
- Modify: `engine/tests/test_output_paths.py`
- Modify: `engine/tests/test_json_ui.py`
- Modify: `src/types/engine.ts`
- Modify: `src-tauri/src/engine/events.rs`
- Modify: `src-tauri/src/commands/engine.rs`

**Interfaces:**
- Consumes: `_source_cache_files`, `_source_cache_key`, `_load_source_cache`, `_save_source_cache`, and `JsonLineUI.configure`.
- Produces these bounded optional configured-event fields:

```text
source_cache_status: "hit" | "miss" | "partial"
source_cache_elapsed_ms: number
source_catalog_rebuilt: boolean
```

- [ ] **Step 1: Add a failing traversal regression test**

In `engine/tests/test_output_paths.py`, create a temporary source root with `src/server/scripts/example.cpp` and `src/include/example.h`. Patch `Path.rglob` with a counter and assert `_source_cache_files(root)` walks the containing `src` tree once, returns both files, and returns no duplicate paths.

- [ ] **Step 2: Add a failing JSON metadata test**

In `engine/tests/test_json_ui.py`, configure a `JsonLineUI` runtime containing the three cache metadata fields and assert the emitted `configured` event preserves them as bounded scalar values.

- [ ] **Step 3: Run focused Python tests and verify the new tests fail**

Run:

```powershell
python -m pytest engine/tests/test_output_paths.py engine/tests/test_json_ui.py -q
```

Expected: the traversal counter and configured-event metadata assertions fail against the current implementation.

- [ ] **Step 4: Remove the redundant source-tree walk**

Change `_source_cache_files` so a source root with `src/` is traversed once from `src/`; only fall back to the alternate root when `src/` does not exist. Preserve suffix filtering, sorted deterministic output, and all source files currently included in the cache key.

- [ ] **Step 5: Record cache timing without changing invalidation rules**

In `configure_runtime`, measure only the cache-key/load/rebuild preparation segment with `time.perf_counter()`. Set:

```python
source_cache_status = 'hit' if source_cache is not None else 'miss'
source_cache_elapsed_ms = round((time.perf_counter() - cache_started) * 1000, 2)
source_catalog_rebuilt = cache_write_needed
```

Add these fields to the returned runtime dictionary and the `JsonLineUI.configure` field allowlist. Do not serialize paths, catalogs, tuple keys, or unbounded payloads in the new fields.

- [ ] **Step 6: Extend the Rust/TypeScript configured-event DTOs**

Add optional fields to `Configured` in `src-tauri/src/engine/events.rs` and the matching `ConfiguredEvent` type in `src/types/engine.ts`. Keep deserialization compatible with older sidecars by using optional/default fields.

- [ ] **Step 7: Run focused Python/Node/Rust contract checks**

Run:

```powershell
python -m pytest engine/tests/test_output_paths.py engine/tests/test_json_ui.py -q
node --experimental-strip-types --test src/lib/__tests__/engineEvents.node-test.ts
cargo test --manifest-path src-tauri/Cargo.toml
```

Expected: cache traversal, JSON, event parsing, and Rust tests pass.

---

### Task 5: Add visible cache status and version synchronization

**Files:**
- Modify: `src/features/forge/ForgeLive.tsx`
- Modify: `src/features/forge/forge.css`
- Modify: `package.json`
- Modify: `package-lock.json`
- Modify: `src-tauri/Cargo.toml`
- Modify: `src-tauri/Cargo.lock`
- Modify: `src-tauri/tauri.conf.json`
- Modify: `engine/version.py`
- Test: `engine/tests/test_output_paths.py`

**Interfaces:**
- Consumes: configured-event cache metadata and existing `0.1.0` version sources.
- Produces: coordinated `0.1.1` metadata, `ENGINE_BUILD_ID` changed from `dev` to a `0.1.1` identity, and a compact Forge startup/cache status line.

- [ ] **Step 1: Add the version contract test**

Assert that package JSON, Tauri JSON, Cargo manifest, and `GENERATOR_VERSION` all report `0.1.1`, while `EVENT_PROTOCOL_VERSION == 1` and `CACHE_SCHEMA_VERSION == 2`.

- [ ] **Step 2: Run the version test and verify it fails**

Run:

```powershell
python -m pytest engine/tests/test_output_paths.py -q
```

Expected: the new version assertion fails because the current release is `0.1.0`.

- [ ] **Step 3: Bump coordinated versions and regenerate lock metadata**

Update the four version sources and set `ENGINE_BUILD_ID` to `forge-0.1.1`. Run `npm install --package-lock-only --ignore-scripts` and `cargo generate-lockfile --manifest-path src-tauri/Cargo.toml` only if the checked-in lock metadata needs the package-version update; do not upgrade dependency families.

- [ ] **Step 4: Render cache status in Forge startup/live UI**

Use the configured event to show a compact status such as `SOURCE CACHE • HIT • 842 ms` or `SOURCE CACHE • REBUILT • 182,431 ms` in the existing phase detail/status region. Keep it text-only and do not add a permanent dashboard panel.

- [ ] **Step 5: Run focused tests and build**

Run:

```powershell
python -m pytest engine/tests/test_output_paths.py -q
npm test -- --run
npm run build
```

---

### Task 6: Full verification and fresh `0.1.1` installer

**Files:**
- Modify only if verification exposes a defect: affected files from Tasks 1–5.
- Generate: `src-tauri/binaries/wotlk-item-forge-x86_64-pc-windows-msvc.exe`, release `dist/` artifacts, installer, and release manifest.

**Interfaces:**
- Consumes: completed motion, progress, cache, and version changes.
- Produces: a fresh `0.1.1` NSIS installer and release evidence.

- [ ] **Step 1: Run the full source suites**

Run:

```powershell
python -m pytest engine/tests -q
npm test -- --run
npm run build
npm run check:tauri-config
cargo fmt --manifest-path src-tauri/Cargo.toml -- --check
cargo clippy --manifest-path src-tauri/Cargo.toml -- -D warnings
cargo test --manifest-path src-tauri/Cargo.toml
```

- [ ] **Step 2: Run the canonical Windows release script**

Run:

```powershell
.\scripts\build-windows-release.ps1
```

Expected: Python/frontend/Rust checks, Nuitka Standalone and OneFile builds, NSIS packaging, and release manifest generation all complete successfully.

- [ ] **Step 3: Verify the artifact identity**

Inspect `dist/release-evidence/release-manifest.json` and assert:

```text
appVersion = 0.1.1
generatorVersion = 0.1.1
eventProtocolVersion = 1
databaseSchemaVersion = 1
targetTriple = x86_64-pc-windows-msvc
```

- [ ] **Step 4: Run packaged process smoke**

Run:

```powershell
.\scripts\windows-smoke.ps1 -AppPath '.\src-tauri\target\release\wotlk-item-forge.exe'
```

- [ ] **Step 5: Report remaining manual checks**

Clearly separate automated results from user-required checks: visual motion, skeleton-to-finalization progress reset, first-run versus cache-hit time, generation completion, cancellation, Library indexing, Reports, History, source drift, and uninstall preservation.
