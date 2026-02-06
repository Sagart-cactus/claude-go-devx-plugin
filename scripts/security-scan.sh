#!/usr/bin/env bash
set -euo pipefail

export PATH="$(go env GOPATH)/bin:${PATH}"

if ! command -v govulncheck >/dev/null 2>&1; then
  echo "govulncheck not found. Install with: go install golang.org/x/vuln/cmd/govulncheck@latest" >&2
  exit 1
fi

echo "=== Scanning for reachable vulnerabilities ==="
govulncheck ./...

echo ""
echo "=== Security scan complete ==="
echo "Note: govulncheck only reports vulnerabilities in code paths you actually use."
