#!/usr/bin/env bash
set -euo pipefail

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  exit 0
fi

if ! command -v go >/dev/null 2>&1; then
  exit 0
fi

changed_go=()
while IFS= read -r file; do
  [[ -n "$file" ]] && changed_go+=("$file")
done < <(git diff --name-only -- '*.go' | head -n 20)
if [[ "${#changed_go[@]}" -eq 0 ]]; then
  exit 0
fi

echo "[go-dev-opinionated] Go files changed. Recommended loop:"
echo "  1) ./scripts/test-fast.sh"
echo "  2) ./scripts/lint.sh"
echo "  3) ./scripts/debug-test.sh <pkg> <regex>  # when a test fails"
exit 0
