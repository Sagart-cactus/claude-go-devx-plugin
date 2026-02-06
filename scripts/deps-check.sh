#!/usr/bin/env bash
set -euo pipefail

echo "=== Stage 1: Module Tidying ==="
go mod tidy

echo ""
echo "=== Stage 2: Dependency Verification ==="
go mod verify

echo ""
echo "=== Stage 3: Direct Dependencies ==="
go list -m -f '{{if not .Indirect}}{{.Path}} {{.Version}}{{end}}' all | grep -v '^$'

echo ""
echo "=== Stage 4: Outdated Check ==="
if command -v go-mod-outdated >/dev/null 2>&1; then
  go list -u -m -json all | go-mod-outdated -update -direct
else
  echo "go-mod-outdated not installed. Install with: go install github.com/psampaz/go-mod-outdated@latest"
  echo "Showing current versions:"
  go list -m all
fi
