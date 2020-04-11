#! /bin/sh

LIB=`pwd`/lib
CARGO=cargo

mkdir -p $LIB

set -x

# can't cargo install :(
$CARGO build
cp target/debug/libcrustgo.a $LIB
