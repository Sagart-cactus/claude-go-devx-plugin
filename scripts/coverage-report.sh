#!/usr/bin/env bash
set -euo pipefail

coverage_file="${1:-coverage.out}"
threshold="${2:-70}"

echo "=== Generating coverage profile ==="
go test -coverprofile="$coverage_file" -covermode=atomic ./...

echo ""
echo "=== Coverage Summary ==="
go tool cover -func="$coverage_file" | tail -n 1

echo ""
echo "=== Package Coverage ==="
go tool cover -func="$coverage_file" | grep -E '^[^[:space:]]' | sort -k3 -rn

total_coverage=$(go tool cover -func="$coverage_file" | tail -n 1 | awk '{print $3}' | sed 's/%//')
echo ""
if (( $(echo "$total_coverage < $threshold" | bc -l) )); then
  echo "WARNING: Coverage ${total_coverage}% is below threshold ${threshold}%"
  exit 1
else
  echo "Coverage ${total_coverage}% meets threshold ${threshold}%"
fi

echo ""
echo "To view HTML report: go tool cover -html=$coverage_file"
