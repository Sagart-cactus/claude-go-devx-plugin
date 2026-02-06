---
description: Run Go benchmarks with statistical analysis support.
argument-hint: [output-file] [filter]
---
Run benchmarks with `${CLAUDE_PROJECT_DIR}/scripts/bench-run.sh [output-file] [filter]`.

Example: `/go:bench-run results.txt BenchmarkEncode`

Runs benchmarks 5 times for statistical confidence and saves results with timestamp.

Compare benchmark runs:
```bash
./scripts/bench-run.sh before.txt BenchmarkFoo
# Make changes
./scripts/bench-run.sh after.txt BenchmarkFoo
benchstat before.txt after.txt
```

Focus benchmarks on hot paths identified via profiling.
