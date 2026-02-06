#!/usr/bin/env bash
set -euo pipefail

# Include Go-installed tools even when GOPATH/bin is not in shell PATH.
export PATH="$(go env GOPATH)/bin:${PATH}"

echo "Checking formatting..."
unformatted=$(gofmt -l . | grep -v '^vendor/' || true)
if [[ -n "$unformatted" ]]; then
  echo "The following files are not gofmt-formatted:" >&2
  echo "$unformatted" >&2
  exit 1
fi

echo "Running go vet..."
go vet ./...

if command -v golangci-lint >/dev/null 2>&1; then
  echo "Running golangci-lint..."
  golangci-lint run ./...
else
  echo "golangci-lint not found; skipping. Install from https://golangci-lint.run/usage/install/"
fi
