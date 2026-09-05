# Task Completion Checklist

After completing a task, verify:

1. **Version consistency**: `info.json` version matches `changelog.txt` if either was modified
2. **Localization**: Any new user-facing strings have entries in `locale/en/k2-sentinel.cfg`
3. **Factorio mod structure**: Ensure `data.lua`, `control.lua`, `settings.lua` follow Factorio conventions
4. **Packaging**: If a new top-level file or directory was added, confirm `.gitattributes` explicitly allows it if it should ship in the MOD (allow-list — unlisted files are excluded by default)
5. **No automated tests**: there's no test suite — verify Lua changes manually (`mise run install` + in-game check)
