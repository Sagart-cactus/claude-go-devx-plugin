---
name: go-development-loop
description: Follow fast feedback loops for Go development workflow
---

# Go Development Loop

Use this workflow when implementing or changing Go code.

## Defaults
- Prefer small, compilable commits.
- Write table-driven tests for behavior changes.
- Keep interfaces narrow and concrete types local.
- Prefer context-aware APIs and explicit error wrapping.

## Feedback Loop
1. Fast loop: `./scripts/test-fast.sh`
2. Standard loop: `./scripts/lint.sh`
3. Full loop: `./scripts/ci-local.sh`

When failing:
- Isolate one failing test first.
- Form a specific hypothesis.
- Fix one root cause at a time.
- Re-run the smallest relevant scope, then broaden.

## Code Review Rubric
- Correctness under edge cases and empty input
- Concurrency safety (races, deadlocks, goroutine leaks)
- Error clarity and observability
- Test quality and coverage of regression path

## Extended Feedback Loops

Beyond the fast → standard → full loop, use these workflows regularly:

4. **Security loop**: `./scripts/security-scan.sh` + `./scripts/gosec-scan.sh`
   - Run: weekly, before releases, after dependency updates
   - Catches: vulnerabilities, code-level security issues

5. **Performance loop**: `./scripts/bench-run.sh` + `./scripts/bench-profile.sh`
   - Run: after optimization attempts, before releases
   - Provides: statistical benchmarks, CPU/memory profiles

6. **Dependency loop**: `./scripts/deps-check.sh`
   - Run: weekly, after pulling changes, when adding dependencies
   - Maintains: clean dependency tree, catches outdated packages

7. **Coverage loop**: `./scripts/coverage-report.sh [threshold]`
   - Run: during feature development, before PRs
   - Enforces: quality gates, identifies untested code

8. **Migration loop**: `./scripts/migrate.sh status` + `up/down`
   - Run: when database schema changes
   - Manages: versioned schema evolution
