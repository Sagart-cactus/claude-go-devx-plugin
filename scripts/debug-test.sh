#!/usr/bin/env bash
set -euo pipefail

export PATH="$(go env GOPATH)/bin:${PATH}"

pkg="${1:-}"
test_filter="${2:-}"

if [[ -z "$pkg" ]]; then
  echo "Usage: $0 <go-package> [test-regex]" >&2
  echo "Example: $0 ./internal/service '^TestReconcile_Create$'" >&2
  exit 1
fi

if ! command -v dlv >/dev/null 2>&1; then
  echo "dlv not found. Install with: go install github.com/go-delve/delve/cmd/dlv@latest" >&2
  exit 1
fi

if [[ -n "$test_filter" ]]; then
  echo "Starting Delve for package $pkg with test filter $test_filter"
  exec dlv test "$pkg" -- -test.run "$test_filter" -test.v
fi

echo "Starting Delve for package $pkg"
exec dlv test "$pkg" -- -test.v
