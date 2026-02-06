#!/usr/bin/env bash
set -euo pipefail

export PATH="$(go env GOPATH)/bin:${PATH}"

if ! command -v gosec >/dev/null 2>&1; then
  echo "gosec not found. Install with: go install github.com/securego/gosec/v2/cmd/gosec@latest" >&2
  exit 1
fi

echo "=== Running static security analysis ==="
gosec -fmt=text -exclude-dir=vendor ./...

echo ""
echo "=== Static security scan complete ==="
