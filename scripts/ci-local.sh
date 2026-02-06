#!/usr/bin/env bash
set -euo pipefail

start_time=$(date +%s)

echo "=== Stage 1: Linting ==="
stage_start=$(date +%s)
"$(dirname "$0")/lint.sh"
stage_end=$(date +%s)
echo "Lint completed in $((stage_end - stage_start))s"
echo ""

echo "=== Stage 2: Race Detection ==="
stage_start=$(date +%s)
go test -race ./...
stage_end=$(date +%s)
echo "Race tests completed in $((stage_end - stage_start))s"
echo ""

echo "=== Stage 3: Coverage ==="
stage_start=$(date +%s)
go test -count=1 -cover ./...
stage_end=$(date +%s)
echo "Coverage tests completed in $((stage_end - stage_start))s"
echo ""

echo "=== Stage 4: Security Scanning ==="
stage_start=$(date +%s)
if command -v govulncheck >/dev/null 2>&1; then
  "$(dirname "$0")/security-scan.sh"
else
  echo "govulncheck not installed, skipping. Run ./scripts/bootstrap-go-tools.sh to install."
fi
stage_end=$(date +%s)
echo "Security scan completed in $((stage_end - stage_start))s"
echo ""

end_time=$(date +%s)
total_time=$((end_time - start_time))
echo "=== CI Local Complete ==="
echo "Total time: ${total_time}s"
