---
description: Classify a failing log and suggest next debugging action.
argument-hint: <path-to-log>
---
Run `${CLAUDE_PROJECT_DIR}/scripts/triage-failure.sh ${ARGUMENTS}`.

Example: `/go:triage-failure /tmp/test-output.log`

Then provide:
1. Failure category
2. Immediate next command to run
3. Breakpoint placement recommendation (1-3 points)
