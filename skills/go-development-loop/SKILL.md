---
name: go-development-loop
description: Opinionated Go development workflow with fast, standard, and full feedback loops.
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
