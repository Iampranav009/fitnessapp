---
name: doc-product
description: Generate public operator docs for Fitness360 → markdown in cloud/docs/product/
always: false
---

# Operator documentation (`/doc-product`)

**Usage:** `/doc-product` · `/doc-product outline` · `/doc-product section renewals`

## Prerequisites

1. Open [doc-product/SKILL.md](../doc-product/SKILL.md) — mandatory
2. Product code at `../product` (workspace) or `vendor/product` (from cloud clone)
3. Write targets in **`gymkhana-cloud`**: `docs/product/*.md` + `src/data/docs/product-guides.ts`

```bash
node -p "require('../product/package.json').name"   # → fitness360
```

## Workflow

### `/doc-product outline`

1. List every `product/src/app/dashboard/**/page.tsx` with one-line purpose
2. Draft planned pages for the `/docs` hub (`PERSONA_PATHS` in `product-guides.ts`)
3. Flag WIP/deprecated/admin-only pages — do not write prose yet

### `/doc-product` (full generate)

1. Complete research checklist (`cloud/docs/internal/DOCUMENTATION_PROMPT_INTERNAL.md`)
2. Write or update markdown in `cloud/docs/product/`
3. Sync `cloud/src/data/docs/product-guides.ts` (slugs, personas, prev/next, sidebar)
4. Update `SOURCES_APPENDIX.md` (internal) with file paths per section
5. Run `npm run build:product-search-index` in cloud

### `/doc-product section <name>`

Regenerate a single guide (e.g. `renewals` → `03-renewals-retention.md`).

## Formatting cheat sheet

```markdown
# Guide title

> **Persona:** …  
> **Entry:** [Getting started](/docs/guides/getting-started)  
> **Exit:** [Next guide](/docs/guides/daily-operations)

> **Note:** Operational tip.

> **Warning:** Something can go wrong.

> **Admin only:** Restricted action.

[[SCREENSHOT: UI step caption]]
```

## Completion gates

- [ ] No GymFlo / GKC / OpenWA in operator copy
- [ ] ADMIN vs Employee matrix matches `app-sidebar.tsx` + `rbac/account-roles.ts`
- [ ] WhatsApp: automated vs manual + OSS gaps stated
- [ ] FEATURE_PARITY cross-checked for documented features
- [ ] `product-guides.ts` includes new slugs and sidebar sections
- [ ] Links use `/docs/guides/<slug>` (and `/docs/updates` where appropriate)

## Install this skill

```bash
npx skills add gymkhana-fitness-360/gymkhana-skills@doc-product -y
npx skills add ../gymkhana-skills -s doc-product -y
```
