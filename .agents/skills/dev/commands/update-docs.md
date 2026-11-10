# `/update-docs` — sync operator docs to the public site

End-to-end workflow: research product code → update markdown → wire website → open PR → deploy on merge.

**Skills used:** `doc-product` (content) + `doc-internal` (routing, parity, appendix)

The docs portal uses **custom Next.js** with Mintlify-*style* UI (sidebar, ⌘K search, callouts) — **not** the Mintlify SaaS platform.

---

## When to run

- New dashboard features shipped in `product/`
- Operator guides are stale vs production UI
- Persona paths or guide navigation need updating
- Screenshots need adding under `public/docs/screenshots/`

---

## Step 1 — Research (product repo)

```bash
find product/src/app/dashboard -name 'page.tsx' | sort
cat product/src/components/app-sidebar.tsx
cat product/docs/FEATURE_PARITY.md
```

Follow `cloud/docs/internal/DOCUMENTATION_PROMPT_INTERNAL.md`.

---

## Step 2 — Update operator markdown (cloud)

Edit **`cloud/docs/product/`**:

| File | Slug |
|------|------|
| `01-getting-started.md` | `getting-started` |
| `02-daily-operations.md` | `daily-operations` |
| `03-renewals-retention.md` | `renewals-retention` |
| `04-configuration.md` | `configuration` |
| `05-glossary.md` | `glossary` |
| `06-faq.md` | `faq` |
| `whatsapp-lifecycle-templates.md` | `whatsapp-lifecycle-templates` |

### Required structure per guide

1. Persona blockquote after H1 (`> **Persona:**` / **Entry** / **Exit**)
2. `**Note:**` / `**Warning:**` / `**Admin only:**` blockquotes for callouts
3. `[[SCREENSHOT: caption]]` for UI steps
4. Internal links: `/docs/guides/<slug>`

---

## Step 3 — Update website wiring (cloud)

| File | Purpose |
|------|---------|
| `src/data/docs/product-guides.ts` | Manifest — slugs, personas, prev/next, `DOC_SIDEBAR_SECTIONS` |
| `src/components/docs/DocsLayout.tsx` | Mintlify-style shell + product ⌘K search |
| `src/components/developers/sections/ProductDocsSection.tsx` | Hub — persona paths |
| `src/app/docs/guides/[slug]/page.tsx` | Static guide routes |

After editing guides or adding sections:

```bash
cd cloud
npm run build:product-search-index   # product docs ⌘K index
npm run build:search-index           # if developer sections changed
npm run sync:releases                # if product/docs/releases.json changed
```

---

## Step 4 — Screenshots

PNG → `cloud/public/docs/screenshots/<slug>.png`

---

## Step 5 — Internal + product sync

| Repo | File | When |
|------|------|------|
| cloud | `docs/internal/SOURCES_APPENDIX.md` | New code paths |
| product | `docs/FEATURE_PARITY.md` | New GA features |
| product | `docs/releases.json` | Release manifest → `npm run sync:releases` in cloud |

---

## Step 6 — PR and deploy

Merge to `main` → Vercel deploys `www.gymkhana.fit`.

Verify:

```bash
curl -s -o /dev/null -w '%{http_code}' https://www.gymkhana.fit/docs
curl -s -o /dev/null -w '%{http_code}' https://www.gymkhana.fit/docs/guides/getting-started
```

Local: `cd cloud && npm run dev` (:3001)

---

## What NOT to publish

- `cloud/docs/internal/*`
- Env vars, Inngest/Prisma jargon in operator copy
- WIP integrator APIs in operator sidebar
