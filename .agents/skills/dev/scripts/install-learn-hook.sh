#!/usr/bin/env bash
# Install a post-commit hook that auto-runs skill learner on diffs (product repo).
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PRODUCT_ROOT="$(tsx "$SCRIPT_DIR/find-product-root.ts")"
HOOKS_DIR="$SCRIPT_DIR/git-hooks"
mkdir -p "$HOOKS_DIR"

cat > "$HOOKS_DIR/post-commit" << HOOK
#!/usr/bin/env bash
cd "$PRODUCT_ROOT" || exit 0
tsx "$SCRIPT_DIR/learner.ts" auto --since HEAD~1 2>/dev/null || true
HOOK
chmod +x "$HOOKS_DIR/post-commit"

git -C "$PRODUCT_ROOT" config core.hooksPath "$HOOKS_DIR"
echo "→ Installed post-commit learner hook at $HOOKS_DIR"
echo "  Uninstall: git -C \"$PRODUCT_ROOT\" config --unset core.hooksPath"
