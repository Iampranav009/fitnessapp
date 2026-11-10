---
name: doc-product
version: "2.1.0"
description: >-
  Generate public operator documentation for Fitness360 — gym owners, managers, and front-desk staff.
  Slash commands: /doc-product (content), /update-docs (full site sync). Output: cloud/docs/product/*.md
compatibility: "Fitness360 product repo (../product or vendor/product); gymkhana-cloud for publishing"
argument-hint: "[generate|outline|section <name>]"
allowed-tools: "shell read write strreplace glob grep"
---

# Fitness360 operator documentation skill

Generate **public-facing product documentation** for gym owners, managers, and front-desk staff who use the Fitness360 dashboard daily.

**Published on** `www.gymkhana.fit/docs` via the **custom Next.js docs portal** (Mintlify-*style* UI — not the Mintlify SaaS platform).

**Out of scope:** Inngest internals, env var lists, file paths in operator copy, contributor ADRs, API reference, internal runbooks, GymFlo legacy naming, OpenWA, WIP MCP/integrator APIs.

**Companion skills / prompts:**
- **Full site sync:** [commands/update-docs.md](../commands/update-docs.md)
- **Internal maintainer:** `.agents/skills/doc-internal/SKILL.md` (workspace local — not in this repo)
- Developer / self-host: `gymkhana-cloud/docs/DOCUMENTATION_PROMPT_DEVELOPER.md`

---

## Persona-first structure (mandatory)

Every guide must have clear **entry** and **exit** points for a named persona.

### Personas

| ID | Who | Primary guides |
|----|-----|----------------|
| `all_staff` | Anyone new | Getting started, Glossary, FAQ |
| `front_desk` | Employee / SUB_ADMIN | Daily operations, Renewals (send reminders) |
| `gym_admin` | Owner / ADMIN | Configuration, WhatsApp templates, Campaigns setup |

### Learning paths (hub)

Defined in `cloud/src/data/docs/product-guides.ts` → `PERSONA_PATHS` and rendered on `/docs` hub (`ProductDocsSection`).

### Per-guide header block

Place immediately after the H1:

```markdown
> **Persona:** …  
> **Entry:** [link or context]  
> **Exit:** [next guide when done]
```

Keep markdown blocks aligned with `product-guides.ts` (personas, prev/next, sidebar).

---

## Before writing

1. **Read code from the product repo only** — `../product` or `vendor/product`.
2. Run research checklist in `cloud/docs/internal/DOCUMENTATION_PROMPT_INTERNAL.md`.
3. **Do not invent features.** Use **Note** / **Admin only** / **Warning** in blockquotes for callouts.
4. Cross-check `product/docs/FEATURE_PARITY.md`.

---

## Branding (mandatory)

| Use | Do not use |
|-----|------------|
| **Fitness360** (or white-label via `NEXT_PUBLIC_APP_NAME`) | GymFlo |
| **Gymkhana** only for `www.gymkhana.fit/docs` links | Gymkhana in simulated in-app labels |
| ₹, IST, WhatsApp-first | Inngest, Prisma, file paths |

---

## Output location

**Markdown:** `gymkhana-cloud/docs/product/*.md`

**Website (update via `/update-docs`):**

- `cloud/src/data/docs/product-guides.ts` — manifest, personas, prev/next, `DOC_SIDEBAR_SECTIONS`
- `cloud/src/components/docs/DocsLayout.tsx` — Mintlify-style sidebar + ⌘K search
- `cloud/src/components/developers/sections/ProductDocsSection.tsx` — hub cards
- `cloud/public/docs/screenshots/*.png` — paired with `[[SCREENSHOT: caption]]`

Use `[[SCREENSHOT: description]]` for UI steps.

Internal links: `/docs/guides/<slug>` (and `/docs/updates`, `/docs/whatsapp-lifecycle-templates`).

Target: **8,000–15,000 words** total across guides.

---

## Formatting rules (renders as Mintlify-style callouts)

| Intent | Markdown |
|--------|----------|
| Note | `> **Note:** …` |
| Warning | `> **Warning:** …` |
| Admin only | `> **Admin only:** …` |

- H1/H2/H3 hierarchy; Purpose → Who → Steps → Tips → Mistakes per workflow
- Tables for permissions and template placeholders
- Distinguish **automated** vs **manual** WhatsApp

---

## Quality bar

- Never document unimplemented features as GA
- Never document playground as production
- After substantive edits, run **`/update-docs`** to sync site + open PR

---

## Slash commands

| Command | Action |
|---------|--------|
| `/doc-product` | Generate or refresh operator markdown |
| `/update-docs` | Markdown + manifest + hub + screenshots + PR |

See [commands/doc-product.md](../commands/doc-product.md) and [commands/update-docs.md](../commands/update-docs.md).
