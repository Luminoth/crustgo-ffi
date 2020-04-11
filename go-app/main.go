package main

import "log"

// #cgo CFLAGS: -Wall -I${SRCDIR}/../include
// #cgo LDFLAGS: -L${SRCDIR}/../lib -lcrustgo -lpthread -ldl
// #include "ffi.h"
import "C"

func main() {
	x := C.int(6)
	y := C.int(7)

	log.Printf("Go says compute_value_a(%d, %d) = %d", x, y, C.compute_value_a(x, y))
}
