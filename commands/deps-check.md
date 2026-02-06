---
description: Audit Go module dependencies, tidy, verify, and check for updates.
---
Run dependency hygiene checks with `${CLAUDE_PROJECT_DIR}/scripts/deps-check.sh`.

Example: `/go:deps-check`

This checks:
1. Module tidiness (removes unused, adds missing)
2. Integrity verification (go.sum matches)
3. Current dependency tree
4. Available updates

Run after: pulling changes, adding new imports, or weekly as maintenance.
