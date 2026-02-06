---
description: Run fast targeted tests for changed Go packages.
argument-hint: [base-ref]
---
Run the plugin fast feedback loop.

Steps:
1. Use `${CLAUDE_PROJECT_DIR}/scripts/test-fast.sh ${ARGUMENTS:-HEAD}`.
2. If tests fail, isolate one failing package/test and run `/go-dev-opinionated:debug-test <pkg> <test-regex>`.
3. Propose the smallest fix that addresses the root cause and rerun fast tests.
