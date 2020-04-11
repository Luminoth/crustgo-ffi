#! /bin/sh

LIB=`pwd`/lib

mkdir -p $LIB

# can't cargo install :(
cargo build
cp target/debug/libcrustgo.a $LIB
