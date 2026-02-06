#!/usr/bin/env bash
set -euo pipefail

target="${1:-./...}"

echo "Running go generate for: $target"
go generate "$target"

echo ""
echo "Checking for uncommitted generated files..."
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  generated_files=$(git diff --name-only -- '*_gen.go' '*.pb.go' 'mock_*.go' 'wire_gen.go' || true)
  if [[ -n "$generated_files" ]]; then
    echo "Generated files changed:"
    echo "$generated_files"
    echo ""
    echo "Review changes and commit if expected."
  else
    echo "No generated file changes detected."
  fi
fi
