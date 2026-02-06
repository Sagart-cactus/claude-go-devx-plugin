---
description: Run opinionated lint and formatting checks.
---
Run `${CLAUDE_PROJECT_DIR}/scripts/lint.sh`.

If lint fails:
1. Apply minimal fixes (gofmt/go vet findings first).
2. Explain any non-obvious lint suppression.
3. Re-run lint and summarize what changed.
