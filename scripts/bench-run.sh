#!/usr/bin/env bash
set -euo pipefail

output_file="${1:-bench-$(date +%Y%m%d-%H%M%S).txt}"
bench_filter="${2:-.}"

echo "Running benchmarks matching: $bench_filter"
echo "Output file: $output_file"
echo ""

go test -run='^$' -bench="$bench_filter" -benchmem -count=5 ./... | tee "$output_file"

echo ""
echo "Benchmark results saved to: $output_file"
echo ""
echo "To compare with previous run:"
echo "  benchstat old.txt $output_file"
