#! /bin/sh

BIN=`pwd`/bin
GOAPP=go-app

mkdir -p $BIN

cargo build

cd $GOAPP

export GOBIN=$BIN

go get
go install
