#! /bin/sh

BIN=`pwd`/bin
INCLUDE=`pwd`/include
LIB=`pwd`/lib
CCAPP=cc-app
CXX=g++

./buildlib.sh

mkdir -p $BIN

cd $CCAPP

set -x

$CXX --std=c++17 -Wall -o $BIN/$CCAPP main.cc -I$INCLUDE -L$LIB -lcrustgo -lpthread -ldl
