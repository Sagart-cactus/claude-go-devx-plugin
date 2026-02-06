---
description: Debug a Go test with Delve using breakpoint-first workflow.
argument-hint: <package> [test-regex]
---
Run `${CLAUDE_PROJECT_DIR}/scripts/debug-test.sh ${ARGUMENTS}`.

Before launching Delve, produce a short breakpoint plan:
1. Entry breakpoint at the failing test or top-level function.
2. Guard-condition breakpoint before expected/actual divergence.
3. Error-path breakpoint where errors are wrapped/returned.

During debugging:
- Inspect locals, call stack, and goroutines.
- State one hypothesis before each step/continue.
- After confirming root cause, apply the smallest safe fix.
- Re-run the exact test, then `/go-dev-opinionated:test-fast`.
