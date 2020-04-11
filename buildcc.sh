#! /bin/sh

BIN=`pwd`/bin
LIB=`pwd`/lib
CCAPP=cc-app
CXX=g++

./buildlib.sh

mkdir -p $BIN

cd $CCAPP

$CXX -c main.cc -o main.o
$CXX -o $BIN/$CCAPP main.o -L$LIB -lcrustgo
