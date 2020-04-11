#! /bin/sh

BIN=`pwd`/bin
CCAPP=cc-app

mkdir -p $BIN

cargo build

cd $CCAPP

echo "TODO: build the C++ app"
