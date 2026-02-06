#!/usr/bin/env bash
set -euo pipefail

package="${1:-}"
mode="${2:-minor}"

if [[ -z "$package" ]]; then
  echo "Usage: $0 <package> [mode]" >&2
  echo "Modes: patch, minor, latest" >&2
  echo "Example: $0 github.com/stretchr/testify minor" >&2
  exit 1
fi

echo "=== Upgrading $package (mode: $mode) ==="
case "$mode" in
  patch)
    go get -u=patch "$package"
    ;;
  minor|latest)
    go get -u "$package"
    ;;
  *)
    echo "Unknown mode: $mode" >&2
    exit 1
    ;;
esac

echo ""
echo "=== Running go mod tidy ==="
go mod tidy

echo ""
echo "=== Testing with upgraded dependency ==="
if go test ./...; then
  echo ""
  echo "SUCCESS: All tests pass with upgraded $package"
  echo "Review changes and commit if satisfied."
else
  echo ""
  echo "FAILURE: Tests failed with upgraded $package"
  echo "To revert: git checkout go.mod go.sum"
  exit 1
fi
