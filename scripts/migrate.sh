#!/usr/bin/env bash
set -euo pipefail

export PATH="$(go env GOPATH)/bin:${PATH}"

if ! command -v goose >/dev/null 2>&1; then
  echo "goose not found. Install with: go install github.com/pressly/goose/v3/cmd/goose@latest" >&2
  exit 1
fi

migrations_dir="${MIGRATIONS_DIR:-./migrations}"
db_driver="${DB_DRIVER:-postgres}"
db_string="${DB_STRING:-}"

if [[ -z "$db_string" ]]; then
  echo "Usage: DB_STRING='connection-string' $0 <command> [args]" >&2
  echo "Commands: up, down, status, create <name>" >&2
  echo "Example: DB_STRING='postgres://user:pass@localhost/db?sslmode=disable' $0 up" >&2
  exit 1
fi

mkdir -p "$migrations_dir"

echo "Running goose $* in $migrations_dir"
cd "$migrations_dir"
goose "$db_driver" "$db_string" "$@"
