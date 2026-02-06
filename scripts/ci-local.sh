#!/usr/bin/env bash
set -euo pipefail

"$(dirname "$0")/lint.sh"

echo "Running race-enabled tests..."
go test -race ./...

echo "Running full test suite with coverage..."
go test -count=1 -cover ./...
