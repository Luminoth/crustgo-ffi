#! /bin/sh

LIB=`pwd`/lib
CARGO=cargo

mkdir -p $LIB

# can't cargo install :(
$CARGO build
cp target/debug/libcrustgo.a $LIB
