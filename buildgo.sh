#! /bin/sh

BIN=`pwd`/bin
GOAPP=go-app
GO=go

./buildlib.sh

mkdir -p $BIN

cd $GOAPP

export GOBIN=$BIN

set -x

$GO get
$GO install
