#!/usr/bin/env bash

asdf install golang latest
asdf global golang latest

go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/jstemmer/gotags@latest
go install golang.org/x/tools/cmd/guru@latest

asdf reshim
