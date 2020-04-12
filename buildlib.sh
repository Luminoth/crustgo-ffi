#! /bin/sh

LIB=`pwd`/lib
INCLUDE=`pwd`/include
RUSTLIB=rust-lib
CARGO=cargo
BINDGEN=cbindgen
BINDGEN_CONFIG=cbindgen.toml
BINDGEN_HEADER=ffi.h

mkdir -p $LIB

set -x

# can't cargo install :(
$CARGO build --release
cp target/release/libcrustgo.a $LIB

$BINDGEN --config $BINDGEN_CONFIG --crate $RUSTLIB --output $INCLUDE/$BINDGEN_HEADER
