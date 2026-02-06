---
name: go-debug-breakpoints
description: Breakpoint-first Go debugging with Delve and structured hypothesis testing.
---

# Go Breakpoint Debugging

Use for failing tests, panics, race reports, and intermittent behavior.

## Breakpoint Strategy
1. Entry breakpoint
- Place at failing test entry or primary function under test.

2. Divergence breakpoint
- Place before mutation or branch where expected vs actual starts to differ.

3. Error-path breakpoint
- Place where errors are created, wrapped, or returned.

4. Concurrency breakpoint
- Place around channel send/receive, lock/unlock, and goroutine spawn points.

## Delve Commands
- Launch: `./scripts/debug-test.sh <pkg> <test-regex>`
- In session: `break`, `continue`, `next`, `step`, `goroutines`, `stack`, `print <expr>`

## Hypothesis Loop
1. State expected state before continue.
2. Continue to next breakpoint.
3. Compare observed state to expectation.
4. Update hypothesis and repeat.

## Exit Criteria
- Root cause identified with evidence from runtime state.
- Minimal fix applied.
- Failing test passes.
- Fast loop passes for changed packages.
