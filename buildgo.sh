#! /bin/sh

BIN=`pwd`/bin
GOAPP=go-app

./buildlib.sh

mkdir -p $BIN

cd $GOAPP

export GOBIN=$BIN

go get
go install
