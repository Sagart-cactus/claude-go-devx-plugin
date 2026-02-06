---
description: Run local CI parity checks (lint, race tests, coverage).
---
Run `${CLAUDE_PROJECT_DIR}/scripts/ci-local.sh` and summarize failures by category:
- compile/type
- lint/style
- test logic regression
- race/concurrency

For the first failing test, suggest a breakpoint plan and then run debug workflow.
