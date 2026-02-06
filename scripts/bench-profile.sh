#!/usr/bin/env bash
set -euo pipefail

package="${1:-./...}"
bench_filter="${2:-.}"

# If package is ./..., pick the first package with benchmarks
if [[ "$package" == "./..." ]]; then
  package=$(go list ./... | head -1)
  echo "Note: Profiling requires a single package. Using: $package"
fi

echo "Running benchmark with profiling: $bench_filter in $package"
go test -run='^$' -bench="$bench_filter" -cpuprofile=cpu.prof -memprofile=mem.prof -benchmem "$package"

echo ""
echo "CPU profile: cpu.prof"
echo "Memory profile: mem.prof"
echo ""
echo "Analyze with:"
echo "  go tool pprof -http=:8080 cpu.prof"
echo "  go tool pprof -http=:8080 mem.prof"
