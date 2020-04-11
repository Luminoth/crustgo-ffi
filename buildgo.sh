#! /bin/sh

GOAPP=go-app

cargo build

cd $GOAPP

go get
go build
