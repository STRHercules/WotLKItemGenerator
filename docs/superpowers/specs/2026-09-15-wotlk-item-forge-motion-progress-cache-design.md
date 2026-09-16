# WotLK Item Forge Motion, Progress, and Cache Refresh

Date: 2026-09-15
Status: Approved design
Scope: subtle visual motion, Forge progress correctness, source-cache performance, and patch version bump

## Goals

- Add restrained motion that reinforces the existing technical grid aesthetic.
- Make phase changes and live generation activity visually legible without distracting from data.
- Reset skeleton progress before full-item finalization begins.
- Reduce repeated source-preparation cost while preserving source-change invalidation and Python generation authority.
- Produce a fresh Windows installer at version `0.1.1`.

## Non-goals

- No canvas, particle engine, animation dependency, or redesign of the visual system.
- No Rust/TypeScript rewrite of generator logic.
- No unsafe cache trust mode that skips source invalidation.
- No change to item formulas, selection, weights, loot algorithms, or output formats.

## Visual motion

Use CSS animations only:

- Slowly drift the existing background grid with very low opacity.
- Add restrained cyan/violet radial glow movement behind the application canvas.
- Add a subtle active sheen to the current progress track and a small pulse to the FORGING indicator.
- Animate phase/content transitions and stagger new discovery cards.
- Keep completed/inactive progress bars static.
- Honor both the persisted Reduce Motion setting and `prefers-reduced-motion`.

Motion is presentation-only and must not create timers, repaint loops, or generator work.

## Forge progress behavior

The engine continues to emit the existing JSONL `phase` and `progress` events.

When the reducer enters `generating_skeletons` or `finalizing_items`, it preserves each class total but resets class completed values to zero. Overall phase progress already resets on a phase event. This produces:

```text
Generate skeletons: 0% -> 100%
Finalize full items: 0% -> 100%
Validate/write output: phase-specific progress
```

The UI will receive a phase key/data attribute so CSS can style the active phase without duplicating generator logic.

## Source-cache performance

The existing Python cache remains authoritative. It already stores reference, feature, and encounter catalogs and is keyed by generator identity, cache schema, source root, relevant options, and source file metadata.

The refresh will:

1. Eliminate redundant recursive traversal in `_source_cache_files()` when the selected script tree is already contained by the selected source tree.
2. Preserve complete file metadata invalidation; no stale-cache trust shortcut.
3. Preserve the Tauri app-local `--source-cache-file` path.
4. Emit/cache-report enough status and timing information to distinguish cache hit, cache miss, and catalog rebuild.
5. Add focused tests proving equivalent cache keys, invalidation on changed source metadata, and a cache hit avoids catalog rebuild work.

The first run may remain source-dependent. Subsequent runs should reuse the persisted catalogs when the source fingerprint and relevant configuration are unchanged.

## Versioning

Bump the coordinated release version from `0.1.0` to `0.1.1` in:

- `package.json` / generated `package-lock.json`
- `src-tauri/Cargo.toml` / generated `src-tauri/Cargo.lock`
- `src-tauri/tauri.conf.json`
- `engine/version.py` generator metadata

Set a new engine build identity so caches created by the previous build are safely invalidated. Keep event protocol version `1` and cache serialization schema `2` unless implementation evidence requires a schema change.

## Verification

- Focused reducer tests prove phase transitions reset class completed values while preserving totals.
- Focused cache tests prove the single-traversal behavior and cache-hit path.
- Frontend tests and production build pass.
- Python tests pass, with the legal external golden fixture remaining an explicit skip when unavailable.
- Rust format, Clippy, and tests pass.
- Nuitka Standalone and OneFile sidecar builds pass.
- Packaged process smoke passes.
- Canonical Windows release script produces the `0.1.1` NSIS installer and release manifest.
- Manual smoke remains required for visual animation, generation progress, first-run/cache-hit timing, cancellation, Library indexing, Reports, History, and uninstall preservation.
