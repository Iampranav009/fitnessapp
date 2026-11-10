#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PRODUCT_ROOT="$(tsx "$SCRIPT_DIR/find-product-root.ts")"
cd "$PRODUCT_ROOT"
exec node packages/cli/bin/fitness360.js doctor "$@"
