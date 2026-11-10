# gymkhana-skills

Public agent skills for [Fitness360](https://github.com/gymkhana-fitness-360/gymkhana) development (Cursor, Claude Code, Codex).

## Install (`dev` skill)

From any machine:

```bash
npx skills add gymkhana-fitness-360/gymkhana-skills@dev -y
```

Workspace layout with sibling clones:

```bash
cd gymkhana-opensource/product
npx skills add ../gymkhana-skills -s dev -y
```

Run `/dev-*` slash commands from a **Fitness360 product repo** checkout (`package.json` name: `fitness360`).

## What this repo is

| In `gymkhana-skills` | In [`gymkhana`](https://github.com/gymkhana-fitness-360/gymkhana) product repo |
|----------------------|----------------------------------------------------------------------------------|
| Agent enforcement (`/dev-setup`, `/dev-validate`, rules) | Application code, APIs, dashboard |
| Playbooks and architecture reference for agents | `docs/adr/`, `docs/DEVELOPMENT.md` |

## Skills

| Skill | Install | Purpose |
|-------|---------|---------|
| `dev` | `npx skills add gymkhana-fitness-360/gymkhana-skills@dev -y` | OSS development (`/dev-*`) |
| `doc-product` | `npx skills add gymkhana-fitness-360/gymkhana-skills@doc-product -y` | Public operator docs → `cloud/docs/product/` |
| `doc-internal` | Workspace `.agents/skills/doc-internal/` only | Maintainer audit, parity, appendix (team only — not in this repo) |

### Documentation commands

| Command | What it does |
|---------|----------------|
| `/doc-product` | Generate or refresh operator markdown |
| `/update-docs` | Full sync: MD + `product-guides.ts` + hub + PR + deploy checklist |

## Structure

```
SKILL.md              # dev skill entry (name: dev)
doc-product/SKILL.md  # external operator documentation
commands/             # /dev-*, /doc-product, /update-docs
rules/                # always-on constraints
references/           # architecture, playbooks
scripts/              # validate, debug, learner (run in product cwd)
learnings/            # captured deviations
```

## License

Apache-2.0 — same as Fitness360 product.
