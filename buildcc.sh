#! /bin/sh

BIN=`pwd`/bin
LIB=`pwd`/lib
CCAPP=cc-app
CXX=g++

./buildlib.sh

mkdir -p $BIN

cd $CCAPP

set -x

$CXX --std=c++17 -o $BIN/$CCAPP main.cc -L$LIB -lcrustgo -lpthread -ldl
