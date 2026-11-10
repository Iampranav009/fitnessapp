# Skill advanced topics — progressive disclosure

Load this file when SKILL.md does not have enough detail.

## Reference index

| Topic | Path |
|-------|------|
| Architecture & domains | [architecture.md](architecture.md) |
| **Business rules** | [business-rules.md](business-rules.md) |
| UI kit deep dive | [ui-kit.md](ui-kit.md) |
| API route template | [templates/api-route.ts](templates/api-route.ts) |
| Playbooks | [playbooks/README.md](playbooks/README.md) |
| Forbidden patterns | [tests/refusal.json](tests/refusal.json) |
| Preferred patterns | [tests/golden.json](tests/golden.json) |

## Slash commands index

| Command | Path |
|---------|------|
| `/dev-setup` | [../commands/setup.md](../commands/setup.md) |
| `/dev-fix` | [../commands/fix.md](../commands/fix.md) |
| `/dev-validate` | [../commands/validate.md](../commands/validate.md) |
| `/dev-new-api` | [../commands/new-api.md](../commands/new-api.md) |
| `/dev-new-dashboard` | [../commands/new-dashboard.md](../commands/new-dashboard.md) |
| `/dev-debug` | [../commands/debugger.md](../commands/debugger.md) |
| `/dev-learn` | [../commands/learner.md](../commands/learner.md) |

Repo npm scripts (typecheck, lint, test): [../commands/npm.md](../commands/npm.md) — **not** skill commands.

## Rules index

| Rule | Path |
|------|------|
| Prerequisites | [../rules/prerequisites-check.mdc](../rules/prerequisites-check.mdc) |
| API routes | [../rules/api-routes.mdc](../rules/api-routes.mdc) |
| Tenant scope | [../rules/tenant-scope.mdc](../rules/tenant-scope.mdc) |
| UI kit | [../rules/ui-kit.mdc](../rules/ui-kit.mdc) |
| Security | [../rules/security.mdc](../rules/security.mdc) |
| Business rules | [../rules/business-rules.mdc](../rules/business-rules.mdc) |
| Operations | [../rules/operations.mdc](../rules/operations.mdc) |
| Comms ops | [../rules/comms-ops.mdc](../rules/comms-ops.mdc) |
| Validation workflow | [../rules/validation-workflow.mdc](../rules/validation-workflow.mdc) |

## Learnings

Team deviations from skill guidance: [../learnings/LEARNINGS.md](../learnings/LEARNINGS.md)

## Repo documentation (OSS)

Product repo: [gymkhana-fitness-360/gymkhana](https://github.com/gymkhana-fitness-360/gymkhana)

| Doc | Link |
|-----|------|
| Quick start | [README.md](https://github.com/gymkhana-fitness-360/gymkhana/blob/main/README.md) |
| Contributing | [CONTRIBUTING.md](https://github.com/gymkhana-fitness-360/gymkhana/blob/main/CONTRIBUTING.md) |
| Development | [docs/DEVELOPMENT.md](https://github.com/gymkhana-fitness-360/gymkhana/blob/main/docs/DEVELOPMENT.md) |
| Architecture decisions | [docs/adr/](https://github.com/gymkhana-fitness-360/gymkhana/tree/main/docs/adr) |
| Agent skill | [gymkhana-skills](https://github.com/gymkhana-fitness-360/gymkhana-skills) |

Install: `npx skills add gymkhana-fitness-360/gymkhana-skills@dev -y`

## Out of scope

Marketing, playground, and `/developers` UI live in the private **gymkhana-cloud** repo (`www.gymkhana.fit`). The product repo serves `/login`, `/dashboard`, and `/api/*` only; `/` redirects to login or dashboard.
