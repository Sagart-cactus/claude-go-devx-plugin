---
description: Run go generate and detect changes in generated code.
argument-hint: [path]
---
Run code generation with `${CLAUDE_PROJECT_DIR}/scripts/generate.sh [path]`.

Example: `/go:generate ./internal/api`

Common generation tools:
- `//go:generate stringer -type=Status`
- `//go:generate mockgen ...`
- `//go:generate protoc ...`
- `//go:generate wire ...`

After generation:
1. Review generated file diffs
2. Run fast tests to ensure no regressions
3. Commit generated files with descriptive message

Note: Keep generated files in version control for build reproducibility.
