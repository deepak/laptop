#!/usr/bin/env bash

mkdir -p "$HOME/go/bin"
export GOPATH="$HOME/go"

# https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on
go get -u github.com/ramya-rao-a/go-outline
go get -u github.com/acroca/go-symbols
go get -u github.com/nsf/gocode
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/zmb3/gogetdoc
go get -u github.com/golang/lint/golint
go get -u github.com/fatih/gomodifytags
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
go get -u golang.org/x/tools/cmd/gorename
go get -u sourcegraph.com/sqs/goreturns
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/cweill/gotests/...
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/josharian/impl
go get -u github.com/haya14busa/goplay/cmd/goplay
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
go get -u github.com/davidrjenni/reftools/cmd/fillstruct

# TODO: install `delve`

echo "[INFO] configure golang"