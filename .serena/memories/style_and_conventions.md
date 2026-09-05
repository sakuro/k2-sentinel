# Style and Conventions

## Lua Code Style
- 2-space indentation
- Standard Factorio mod Lua conventions
- `require` for base game modules (e.g., `__base__.prototypes.entity.hit-effects`)

## Prototype Conventions
- All mod entities/items use `kr-` prefix (from Krastorio2 origin)
- Prototypes split into separate files under `prototypes/`
- `data.lua` only contains `require` statements
- Vanilla prototypes modified via `data.raw` direct assignment (not `data:extend`)
- Mod's own prototypes registered via `data:extend({})`

## Localization
- `locale/{lang}/k2-sentinel.cfg` using INI-like format
- Uses `__ENTITY__kr-sentinel__` references for recipe/technology names
- 24 languages supported

## Changelog Format
Factorio format:
```
---------------------------------------------------------------------------------------------------
Version: X.Y.Z
Date: YYYY-MM-DD
  Category:
    - Description
```

## Git Conventions
- Commit messages use gitmoji prefixes, enforced by `hk`'s `emoji-enforced` commit-msg hook
- `.gitattributes` controls `export-ignore` (allow-list style) for `git archive`-based packaging
