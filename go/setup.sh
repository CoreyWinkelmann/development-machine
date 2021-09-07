#!/usr/bin/env bash

GO_VERSION="${1:-latest}"

asdf install golang $GO_VERSION
asdf global golang $GO_VERSION

go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/jstemmer/gotags@latest
go install golang.org/x/tools/cmd/...@latest
# go install github.com/golangci/golangci-lint@latest
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin v1.42.0

asdf reshim
