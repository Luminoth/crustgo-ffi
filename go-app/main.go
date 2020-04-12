package main

import "log"

// #cgo CPPFLAGS: -I${SRCDIR}/../include
// #cgo CXXFLAGS: -std=c++17 -Wall
// #cgo LDFLAGS: -L${SRCDIR}/../lib -lcrustgo -lpthread -ldl
// #include "ffi.h"
import "C"

func main() {
	input := C.InputValues{
		x: 6,
		y: 7,
		z: 8,
	}
	output := C.compute_values(&input, 3)

	log.Printf("Go says compute_values(%s) = %s", C.GoString(C.InputValues_to_string(&input)), C.GoString(C.OutputValues_to_string(&output)))

	values := [...]C.long{1, 2, 3, 4, 5}

	log.Printf("Array before: %v", values)
	C.reorder_values((*C.long)(&values[0]), C.ulong(len(values)))
	log.Printf("Array after: %v", values)
}
