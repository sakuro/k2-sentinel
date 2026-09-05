# K2 Sentinel - Project Overview

## Purpose
Factorio 2.x mod: standalone sentinel radar extracted from Krastorio2 for vanilla gameplay.
Incompatible with Krastorio2 / Krastorio2-spaced-out (declared in dependencies).

## Tech Stack
- **Language**: Lua (mod code)
- **Platform**: Factorio 2.x modding API
- **Dependencies**: base >= 2.1, incompatible with Krastorio2
- **Tooling**: mise (tasks, tool versions), hk (git hooks)
- **Key tool**: `factorix` CLI (mise-managed `github:sakuro/factorix`) - build, upload, changelog management

## Code Structure
```
info.json           - Mod metadata (name, version, dependencies)
data.lua            - Data stage entry: requires all prototype modules
control.lua         - Control stage: adds sentinels to freeplay starting items
prototypes/
  sentinel.lua      - Sentinel entity (radar type, 1x1), item, and recipe definitions
  technology.lua    - Sentinel technology + vanilla radar technology rebalance
  radar-updates.lua - Vanilla radar stat rebalance (health, energy, range)
  achievement.lua   - "Big brother is watching you" (build 100 sentinels)
locale/             - Localization (24 languages)
graphics/           - Icons, building sprites, technology/achievement art
sounds/             - Building sound effects
tasks/              - mise task scripts (build, install, clean, release/*)
mise.toml           - Tool versions, task config, MOD_LICENSE/MOD_CATEGORY/MOD_TAGS
hk.pkl              - git hooks config (gitleaks, commit message conventions)
doc/                - Documentation
.github/            - GitHub Actions for release management
```

## References (not part of MOD)
`references/` contains git submodules for development reference only (export-ignored):
- `Krastorio2/` - Krastorio2 mod source
- `Krastorio2Assets/` - Krastorio2 assets
- `factorio-data/` - Factorio base data

These are excluded from the MOD package via `.gitattributes` export-ignore.

## Key Implementation Details
- Entity prefix: `kr-` (e.g., `kr-sentinel`) to maintain K2 compatibility
- Sentinel is a 1x1 radar with nearby-only scanning (sector scan disabled via 1YJ energy)
- Vanilla radar is rebalanced: stronger stats, requires sentinel as ingredient, needs chemical science
- Technology chain: lamp → kr-sentinel → radar

## Release Process
- GitHub Actions workflows handle release preparation and publishing
- `release-preparation.yml`: Creates release branch, updates version, prepares changelog
- `release-validation.yml`: Validates PR for release
- `release-publish.yml`: Publishes to Factorio MOD Portal + GitHub Release
- MOD package built via `git archive` (`.gitattributes` allow-list controls included files)
- Adding a fresh `Version: Unreleased` changelog section for the next cycle is a manual step (see CONTRIBUTING.md), not automated

## No test suite
There is no automated test lane (no busted, no CI). Verification is manual: `mise run build`/`mise run install` plus in-game checks.
