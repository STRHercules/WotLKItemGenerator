# WotLK Item Forge Implementation Plan Index

This plan suite implements `docs/superpowers/specs/2026-09-15-wotlk-item-forge-desktop-design.md` in dependency order.

1. `2026-09-15-01-foundation-engine-bridge.md`
   - Tauri/React scaffold
   - desktop-safe generator paths/build identity
   - JSON event protocol
   - Rust sidecar supervision/cancellation
   - frontend run-state bridge

2. `2026-09-15-02-local-data-library-history.md`
   - SQLite schema/migrations
   - run history/configuration
   - NDJSON item indexing
   - Library search/detail
   - reports/placements
   - settings/source drift
   - typed storage commands

3. `2026-09-15-03-six-page-desktop-ui.md`
   - visual system/app shell
   - Forge configure/live/complete
   - Sources
   - Library/item inspector
   - Reports
   - History/regenerate/source drift
   - Settings/storage safety

4. `2026-09-15-04-packaging-regression-release.md`
   - deterministic CLI/JSON regression
   - Nuitka sidecar
   - Tauri externalBin/least-privilege capabilities
   - NSIS installer
   - clean-Windows smoke
   - Windows CI/release verification

## Execution Order

Execute plans strictly in numerical order. A plan's Exit Criteria are the gate for beginning the next plan.

## Global Verification

At the end of every plan, run all affected Python, React, and Rust test suites rather than only the newest test file. Before any claim that the application is complete or release-ready, run the full verification defined in Plan 4 Task 6.
