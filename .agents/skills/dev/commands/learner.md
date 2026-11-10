---
name: dev-learn
description: Capture when skill guidance and implementation diverge
always: false
argument-hint: "[capture|from-git|auto|list|summarize]"
---

# Skill learner (`/dev-learn`)

**Usage:** `/dev-learn <mode> [options]`

Storage: `gymkhana-skills/learnings/captured.jsonl` + `gymkhana-skills/learnings/LEARNINGS.md` (sibling repo to `product/`)

## Modes

### `/dev-learn capture`

When an agent suggested X but you chose Y:

```bash
npx tsx ../gymkhana-skills/scripts/learner.ts capture \
  --skill dev \
  --suggested "Use Dialog for edit member" \
  --actual "Used Sheet — full-height on mobile" \
  --reason "Better thumb reach" \
  --files src/app/dashboard/members/[id]/page.tsx \
  --tags ui,mobile
```

### `/dev-learn from-git`

After a commit that diverged from skill advice:

```bash
npx tsx ../gymkhana-skills/scripts/learner.ts from-git --skill dev --suggested "Put logic in domain handlers"
npx tsx ../gymkhana-skills/scripts/learner.ts from-git --staged --suggested "Use formatCurrency for all money"
```

### `/dev-learn auto`

Auto-detect divergences in diff (hardcoded grays, inline Prisma, currency, tenant hints):

```bash
npx tsx ../gymkhana-skills/scripts/learner.ts auto
npx tsx ../gymkhana-skills/scripts/learner.ts auto --staged
```

### `/dev-learn list`

```bash
npx tsx ../gymkhana-skills/scripts/learner.ts list --limit 10
```

### `/dev-learn summarize`

Refresh `LEARNINGS.md`:

```bash
npx tsx ../gymkhana-skills/scripts/learner.ts summarize
```

## Optional post-commit hook

```bash
bash ../gymkhana-skills/scripts/install-learn-hook.sh
```

## Agent workflow

1. Read `skills/SKILL.md` before implementing
2. On deviation → `/dev-learn capture` or `/dev-learn auto --staged`
3. Before similar work → skim `gymkhana-skills/learnings/LEARNINGS.md`
