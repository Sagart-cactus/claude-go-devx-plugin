---
description: Profile Go benchmarks for CPU and memory analysis.
argument-hint: [package] [filter]
---
Profile benchmarks with `${CLAUDE_PROJECT_DIR}/scripts/bench-profile.sh [package] [filter]`.

Example: `/go:bench-profile ./internal/api BenchmarkEncode`

Generates CPU and memory profiles for detailed performance analysis.

Analyze profiles:
```bash
go tool pprof -http=:8080 cpu.prof
go tool pprof -http=:8080 mem.prof
```

Look for: hot functions, allocation patterns, goroutine leaks.
