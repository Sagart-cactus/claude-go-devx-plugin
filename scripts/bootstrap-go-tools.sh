#!/usr/bin/env bash
set -euo pipefail

echo "Installing Go developer tools..."
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/go-delve/delve/cmd/dlv@latest

echo "Done. Ensure $(go env GOPATH)/bin is in PATH."
