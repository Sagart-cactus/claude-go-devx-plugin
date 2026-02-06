# go-dev-opinionated

Opinionated Claude plugin for Go development with a practical debug-and-feedback loop.

## What this plugin gives you
- Fast targeted test loop for changed Go packages
- Lint + vet guardrails
- Local CI parity command (race + coverage)
- Breakpoint-first debugging workflow with Delve
- Failure triage helper to decide next action quickly

## Plugin structure
- `.claude-plugin/plugin.json`: plugin manifest
- `commands/`: Claude slash commands
- `skills/`: reusable Go development/debugging instructions
- `hooks/hooks.json`: post-edit guidance hook
- `scripts/`: runnable local workflow scripts

## Recommended tooling
- Go 1.22+
- `gopls`
- `golangci-lint`
- `dlv`

Install tools:

```bash
./scripts/bootstrap-go-tools.sh
```

## Daily loop
1. Make a change.
2. Run fast tests:

```bash
./scripts/test-fast.sh
```

3. Run lint/vet:

```bash
./scripts/lint.sh
```

4. Before pushing, run full local CI:

```bash
./scripts/ci-local.sh
```

## Debugging failing tests like real developers
1. Reproduce one failing test.
2. Start Delve:

```bash
./scripts/debug-test.sh ./path/to/pkg '^TestName$'
```

3. Set 2-3 breakpoints:
- test/function entry
- pre-mutation branch where state diverges
- error return or panic path

4. Inspect runtime state (`stack`, `goroutines`, locals) and validate one hypothesis at a time.
5. Apply minimal fix and rerun fast loop.

## Failure triage
If you have a failure log file:

```bash
./scripts/triage-failure.sh /tmp/test.log
```

The script classifies the failure and suggests the next debug step.

## Optional editor setup
A sample launch configuration is in `templates/vscode-launch.json`.
