# WotLK Item Forge Six-Page Desktop UI Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the approved Forge, Sources, Library, Reports, History, and Settings experience on top of the engine and storage APIs from Plans 1–2.

**Architecture:** React feature modules consume typed Tauri clients; components never contain generator formulas or direct SQL. A persistent app shell provides navigation and source-health status. Forge owns transient generation state; all durable run/item/report/settings data comes from the Rust backend.

**Tech Stack:** React, TypeScript, CSS modules or colocated plain CSS, Vitest, React Testing Library, `@tanstack/react-virtual` for large item lists, Tauri dialog APIs.

**Spec:** `docs/superpowers/specs/2026-09-15-wotlk-item-forge-desktop-design.md`

## Global Constraints

- Implement after Plans 1–2.
- Deep navy/blue-black canvas, cool steel borders, cyan/teal interaction accents, restrained glow/texture.
- Rarity colors are semantic, not decorative everywhere.
- Library remains read-only.
- Render generated names/descriptions as text, never executable HTML.
- Large item lists use virtualization.
- Live progress rendering is coalesced/throttled so high-frequency events do not lock the UI.
- Common Forge options are visible; power-user options live in an Advanced drawer.

---

## File Structure Locked by This Plan

- `src/styles/tokens.css`, `src/styles/global.css` — visual system.
- `src/components/AppShell/*` — chrome/navigation/status.
- `src/components/ui/*` — focused reusable controls/cards/table primitives.
- `src/features/forge/*` — Configure, Live Forge, Completion.
- `src/features/sources/*` — source health/details/cache controls.
- `src/features/library/*` — filters, virtual list, item inspector/raw data.
- `src/features/reports/*` — tabs/summary/table/raw-file actions.
- `src/features/history/*` — run list/detail/regenerate/source drift.
- `src/features/settings/*` — grouped settings/storage actions/about.
- `src/routes.tsx` — simple local route/tab model; no web URL requirement.

---

### Task 1: Build the Visual System and Persistent App Shell

**Files:**
- Create: `src/styles/tokens.css`
- Create: `src/styles/global.css`
- Create: `src/components/AppShell/AppShell.tsx`
- Create: `src/components/AppShell/AppShell.test.tsx`
- Create: `src/routes.tsx`
- Modify: `src/App.tsx`

**Interfaces:**
- Produces navigation IDs `forge`, `sources`, `library`, `reports`, `history`, `settings`.
- Produces `AppShell({activePage, onNavigate, sourceHealth, children})`.

- [ ] **Step 1: Write failing navigation/accessibility tests**

Render the shell, assert six navigation buttons with accessible names, active-page indication, heading region, and source health label.

- [ ] **Step 2: Implement design tokens**

Define CSS custom properties for canvas/panel/border/text/cyan/success/warning/failure and WoW rarity colors. Add compact and comfortable spacing tokens plus reduced-motion media query.

- [ ] **Step 3: Implement AppShell and page switching**

Use semantic `<nav>`, buttons, `<main>`, and top chrome. Keep route state local in v1; page navigation must not reload the webview.

- [ ] **Step 4: Run tests/build and commit**

Run: `npm test && npm run build`

Commit:

```bash
git add src
git commit -m "feat(ui): add WotLK Forge design system and app shell"
```

---

### Task 2: Build Forge Configure, Readiness, and Advanced Options

**Files:**
- Create: `src/features/forge/ForgePage.tsx`
- Create: `src/features/forge/ForgeConfigure.tsx`
- Create: `src/features/forge/ForgeConfigure.test.tsx`
- Create: `src/features/forge/forgeConfig.ts`
- Create: `src/components/ui/SegmentedControl.tsx`
- Create: `src/components/ui/Toggle.tsx`

**Interfaces:**
- Produces normalized `ForgeConfig` matching `GenerationRequest` from Plan 1.
- `canBeginForging(readiness, config)` returns false for missing blocking sources, unwritable output, zero classes, invalid count, or invalid advanced values.

- [ ] **Step 1: Write failing readiness/form tests**

Test defaults, expansion selector, class multi-select, item count constraints, effects, loot placement, feature toggles, seed auto/explicit, Advanced drawer, and Begin Forging disabled/enabled states.

- [ ] **Step 2: Implement normalized config model**

Keep UI labels separate from engine CLI argument mapping. Classes use the generator's canonical names. Item count supports generator caps and displays the effective selected-class maximum before submission.

- [ ] **Step 3: Implement native browse actions for output/manifest/source override fields**

Use `@tauri-apps/plugin-dialog` only through a small `src/lib/dialogs.ts` wrapper so tests can mock it.

- [ ] **Step 4: Implement readiness strip**

Show required-source count, AzerothCore status, DBC baseline status, output writability, and a direct navigation action to Sources for blockers.

- [ ] **Step 5: Run tests and commit**

Run: `npm test -- src/features/forge && npm run build`

Commit:

```bash
git add src/features/forge src/components/ui src/lib/dialogs.ts
git commit -m "feat(forge): build generation configuration workbench"
```

---

### Task 3: Build Live Forge, Cancellation, Discovery Feed, and Completion

**Files:**
- Create: `src/features/forge/ForgeLive.tsx`
- Create: `src/features/forge/ForgeComplete.tsx`
- Create: `src/features/forge/ForgeLive.test.tsx`
- Modify: `src/features/forge/ForgePage.tsx`

**Interfaces:**
- Consumes Plan 1 `RunState` and engine client.
- Produces callbacks: `onCancel`, `onBrowseItems`, `onViewReports`, `onOpenOutput`, `onForgeAnother`.

- [ ] **Step 1: Write failing Live Forge tests**

Test current phase/detail, overall progress, class bars, elapsed text, newest discoveries, rarity/effect semantic class names, cancel action, and no duplicate set discovery cards when the state already de-duplicates them.

- [ ] **Step 2: Add progress repaint coalescing**

Use `requestAnimationFrame` or a 50–100ms state coalescer for progress-only events while processing terminal events (`complete`, `error`, `validation`) immediately.

- [ ] **Step 3: Implement completion/failure/indexing states**

Successful generation shows summary and links. Validation failure uses failure treatment. Successful generation plus failed indexing shows success + separate indexing warning with Retry Indexing.

- [ ] **Step 4: Implement safe cancellation UI**

Cancel asks for confirmation only once, disables itself after request, and shows `Cancelling…` until the process exit/cancelled state arrives.

- [ ] **Step 5: Run tests and commit**

Run: `npm test -- src/features/forge && npm run build`

Commit:

```bash
git add src/features/forge
git commit -m "feat(forge): add live generation dashboard and completion states"
```

---

### Task 4: Build the Sources Health Dashboard

**Files:**
- Create: `src/features/sources/SourcesPage.tsx`
- Create: `src/features/sources/SourceRow.tsx`
- Create: `src/features/sources/SourcesPage.test.tsx`
- Create: `src/types/sources.ts`
- Create: `src/lib/tauriSources.ts`

**Interfaces:**
- Produces backend requests for `scan_sources`, `clear_source_cache`, `rebuild_source_cache` (implemented as thin Rust commands if not already present).
- Displays required and optional sources separately.

- [ ] **Step 1: Write failing health-state tests**

Test healthy, required missing, optional missing, expanded source detail, bundled-vs-override origin, cache age/validity, Browse, Rescan, Rebuild Cache, and Clear Cache actions.

- [ ] **Step 2: Add Rust source-scan commands if Plan 2 did not expose live scanning**

The command returns logical name, required/optional, resolved path, exists, size, modified timestamp, origin, fingerprint where calculated, plus aggregate health.

- [ ] **Step 3: Implement page and expandable source rows**

Required missing is red/blocking; optional missing is neutral. Never label an absent optional gameobject source as an error.

- [ ] **Step 4: Run frontend/Rust tests and commit**

Run: `npm test -- src/features/sources && cargo test --manifest-path src-tauri/Cargo.toml`

Commit:

```bash
git add src/features/sources src/lib src/types src-tauri/src/commands
git commit -m "feat(sources): add source health and cache dashboard"
```

---

### Task 5: Build the Virtualized Library and Item Inspector

**Files:**
- Create: `src/features/library/LibraryPage.tsx`
- Create: `src/features/library/LibraryFilters.tsx`
- Create: `src/features/library/VirtualItemList.tsx`
- Create: `src/features/library/ItemInspector.tsx`
- Create: `src/features/library/LibraryPage.test.tsx`
- Modify: `package.json`

**Interfaces:**
- Consumes Plan 2 `searchItems`/`getItem` APIs.
- Uses `@tanstack/react-virtual` for visible rows.
- Keeps filter state serializable so History can open Library scoped to a run.

- [ ] **Step 1: Add `@tanstack/react-virtual` and write failing Library tests**

Test search, run/seed/class/role/quality/kind/level/set/effect/socket/placement/entry filters, result count, row selection, inspector open/close, and raw data tab.

- [ ] **Step 2: Implement debounced backend search**

Text input debounce is 150–250ms. Select/range filter changes submit immediately. Reset returns to unfiltered current scope. Never load all items into frontend memory.

- [ ] **Step 3: Implement virtual list and semantic row styling**

Rows show item name, quality, class, slot/kind, and item level. Color only rarity indicator/name accent, not the entire row.

- [ ] **Step 4: Implement item inspector**

Sections match the approved spec. Text content uses normal React text nodes. Actions Copy ID, Open Run, and Reports use existing navigation APIs. Raw Data pretty-prints the exact stored JSON.

- [ ] **Step 5: Run tests/build and commit**

Run: `npm test -- src/features/library && npm run build`

Commit:

```bash
git add package.json package-lock.json src/features/library
git commit -m "feat(library): add virtual item browser and inspector"
```

---

### Task 6: Build Reports Tabs and Raw-File Actions

**Files:**
- Create: `src/features/reports/ReportsPage.tsx`
- Create: `src/features/reports/ReportSummary.tsx`
- Create: `src/features/reports/ReportTable.tsx`
- Create: `src/features/reports/ReportsPage.test.tsx`

**Interfaces:**
- Consumes `listReports`, `readReportTable`, and selected run ID.
- Tabs: Summary, Validation, World Loot, Dungeons/Raids, Sets, Encounter Coverage, Distribution, Source Audit.

- [ ] **Step 1: Write failing tab/summary/table tests**

Test tab availability based on indexed artifacts, validation success/failure, summary counts, paged table rows, sorting/filter affordances, empty/missing report states, and Open Raw File button.

- [ ] **Step 2: Implement Summary and Validation**

Render quality/feature counts and name repairs from stored summary/report data. Do not re-calculate generator validation in React.

- [ ] **Step 3: Implement reusable paged report table**

Render backend-provided headers/rows, client-side column visibility only, backend paging for large files, and safe text cells.

- [ ] **Step 4: Implement raw-file opening through a restricted Tauri command**

The frontend passes a report ID, not an arbitrary shell command. Rust resolves the indexed file path and asks the OS to open it.

- [ ] **Step 5: Run tests and commit**

Run: `npm test -- src/features/reports && cargo test --manifest-path src-tauri/Cargo.toml`

Commit:

```bash
git add src/features/reports src-tauri/src/commands
git commit -m "feat(reports): add in-app report browser"
```

---

### Task 7: Build History, Regenerate Preload, and Source Drift

**Files:**
- Create: `src/features/history/HistoryPage.tsx`
- Create: `src/features/history/RunDetail.tsx`
- Create: `src/features/history/HistoryPage.test.tsx`

**Interfaces:**
- Consumes Plan 2 run/source APIs.
- Produces `loadHistoricalConfigIntoForge(runId)` navigation action; never auto-starts generation.

- [ ] **Step 1: Write failing history tests**

Test complete/failed/cancelled cards, seed/expansion/classes/count/duration, Run Detail metadata, Library/Reports links, source-drift warning, and Regenerate loading config without invoking start generation.

- [ ] **Step 2: Implement run list and filters**

Search/filter by status and expansion. Sort newest first. Use concise cards and status semantics.

- [ ] **Step 3: Implement Run Detail and source drift**

Show engine/build/protocol, output folder, exact config, timestamps, report summary, and changed/missing sources.

- [ ] **Step 4: Implement Forge preload**

Persist a one-shot `pendingForgeConfig` in app state. Navigating to Forge consumes it into the form, leaving Begin Forging as an explicit user action.

- [ ] **Step 5: Run tests and commit**

Run: `npm test -- src/features/history && npm run build`

Commit:

```bash
git add src/features/history src/App.tsx
git commit -m "feat(history): add reproducible run history and regenerate preload"
```

---

### Task 8: Build Settings and Storage Safety Actions

**Files:**
- Create: `src/features/settings/SettingsPage.tsx`
- Create: `src/features/settings/SettingsPage.test.tsx`
- Create: `src/components/ui/ConfirmAction.tsx`

**Interfaces:**
- Consumes Plan 2 settings and index maintenance APIs.
- Clear Library Index never deletes files; destructive filesystem output deletion is not part of Settings.

- [ ] **Step 1: Write failing grouped-settings tests**

Test General, Generator, Appearance, Paths, Storage, About sections; saved defaults; density/reduce-motion; Browse path actions; clear/rebuild confirmations; version labels.

- [ ] **Step 2: Implement settings form with explicit save status**

Persist changes through backend APIs. Show `Saved`/error state. Apply appearance changes immediately while still persisting them.

- [ ] **Step 3: Implement safe storage actions**

Clear Library Index confirmation explicitly says generated packs remain untouched. Rebuild shows progress/count and disables concurrent rebuild.

- [ ] **Step 4: Run tests and commit**

Run: `npm test -- src/features/settings && npm run build`

Commit:

```bash
git add src/features/settings src/components/ui
git commit -m "feat(settings): add application preferences and safe storage tools"
```

---

## Plan 3 Exit Criteria

All six pages exist in the persistent shell, common Forge generation is usable end-to-end against the engine bridge, successful runs are browseable through Library/Reports/History, source health is visible, and settings persist. Run:

```bash
npm test
npm run build
cargo test --manifest-path src-tauri/Cargo.toml
```

All PASS.
