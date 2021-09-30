#! /bin/sh

BIN=`pwd`/bin
INCLUDE=`pwd`/include
LIB=`pwd`/lib
CXXAPP=cxx-app
CXX=g++

./buildlib-cxx.sh

mkdir -p $BIN

cd $CXXAPP

set -x

$CXX --std=c++17 -Wall -o $BIN/$CXXAPP main.cc ../include/ffi-cxx.cc -I$INCLUDE -L$LIB -lcrustgo_cxx -lpthread -ldl
