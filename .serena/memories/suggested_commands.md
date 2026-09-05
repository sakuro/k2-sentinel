# Suggested Commands

## Setup
```sh
mise trust
mise install     # installs tools; also runs `hk install` via postinstall
```

## Build & Development (mise tasks)
- `mise run build` - Build release zip via `git archive`
- `mise run install` - Build and install to local Factorio mods directory
- `mise run clean` - Remove `dist/`
- `mise run release:portal` - Upload to Factorio MOD Portal via `factorix` (CI only)
- `mise run release:github` - Create GitHub Release via `factorix`/`gh` (CI only)
- `mise tasks ls -l` - List all local tasks

## Tools
- `factorix` - Factorio CLI tool for mod upload/edit and path lookup (mise-managed, no `bundle exec` needed)

## Git Workflow
- Commit message prefix: gitmoji (`:bookmark:`, `:new:`, `:art:`, etc.), enforced by `hk`
- Release branches: `release-v{VERSION}`
- Release tags: `v{VERSION}`
