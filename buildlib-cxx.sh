#! /bin/sh

LIB=`pwd`/lib
INCLUDE=`pwd`/include
RUSTLIB=rust-lib-cxx
CARGO=cargo

BRIDGE=cxxbridge
BRIDGE_HEADER=ffi-cxx.h
BRIDGE_SRC=ffi-cxx.cc

mkdir -p $LIB

set -x

# can't cargo install :(
$CARGO build --release
cp target/release/libcrustgo_cxx.a $LIB

$BRIDGE $RUSTLIB/src/lib.rs --header > $INCLUDE/$BRIDGE_HEADER
$BRIDGE $RUSTLIB/src/lib.rs > $INCLUDE/$BRIDGE_SRC
