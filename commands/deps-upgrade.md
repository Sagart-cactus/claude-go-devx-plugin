---
description: Safely upgrade a dependency with automatic testing.
argument-hint: <package> [mode]
---
Upgrade and test a dependency with `${CLAUDE_PROJECT_DIR}/scripts/deps-upgrade.sh <package> [mode]`.

Example: `/go:deps-upgrade github.com/stretchr/testify minor`

Modes:
- `patch`: Upgrade to latest patch version (1.2.3 -> 1.2.4)
- `minor`: Upgrade to latest minor version (1.2.3 -> 1.3.0)
- `latest`: Upgrade to latest version (1.2.3 -> 2.0.0)

Workflow:
1. Upgrades specified package
2. Runs go mod tidy
3. Executes full test suite
4. Reports success or suggests revert

If tests fail, review breaking changes in package changelog before retrying.
