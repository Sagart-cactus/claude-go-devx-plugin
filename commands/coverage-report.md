---
description: Generate detailed coverage report with threshold checking.
argument-hint: [threshold]
---
Generate coverage analysis with `${CLAUDE_PROJECT_DIR}/scripts/coverage-report.sh [threshold]`.

Example: `/go:coverage-report 75`

Generates:
1. Overall coverage percentage
2. Per-package coverage breakdown
3. Threshold check (default 70%)
4. HTML visualization option

To explore coverage visually:
```bash
./scripts/coverage-report.sh
go tool cover -html=coverage.out
```

Focus coverage efforts on critical paths: error handling, edge cases, and business logic.
