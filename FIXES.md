# WotLKItemGenerator v3.0.1 Fixes

This bundle applies the post-v3.0 audit fixes to the supplied v3.0 generator.

## Balance and safety

- Special-effect source quality can never exceed generated item quality.
- Low-level effect matching uses tighter progression windows: ±5 below ilvl 40, ±10 below ilvl 70, ±15 thereafter, further limited by `--effect-ilvl-window`.
- Effect packages prefer exact roles, allow only explicitly compatible adjacent roles, then generic sources; unrelated roles are rejected.
- Disenchant sources with negative `RequiredDisenchantSkill` are rejected.
- Disenchant source quality must exactly match generated item quality.
- Socket bonus sources cannot flow downward from higher-quality gear and use role/progression filtering.
- Generated set templates cannot flow downward from higher quality and must match the generated role when a source role is known.

## Item sets

- Generated set names no longer expose internal class/role labels such as `Feral Rogue` or `Restoration Paladin`.
- Set titles use WotLK-style themes such as `Battlegear of the Frozen Star` and role-appropriate set families.
- Piece names use the theme rather than nesting the full set title, and use role/style-appropriate nouns.
- Generated set bonuses normalize to exactly one 2-piece and one 4-piece bonus for normal five-piece sets.
- Per-item `set_bonuses` metadata now records the final generated bonuses, not unreachable source thresholds.
- Generated `ItemSet.dbc` is staged for both client and server: `client/ItemSet.dbc` and `server/dbc/ItemSet.dbc`.

## Naming and portability

- Heavy `Oath` overuse is deterministically throttled.
- Validation checks Oath distribution only on statistically meaningful item counts, so tiny smoke tests remain usable.
- Source paths written into generated reports/readmes are portable and no longer expose full host filesystem paths.

## Verification

The included regression suite covers these fixes. A complete 100,000-item regeneration still requires the normal AzerothCore/DBC source bundle beside the generator.
