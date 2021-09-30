#include <iostream>

#include "cxx.h"
#include "ffi-cxx.h"

void print_array(int64_t *values, size_t len) {
  std::cout << "[";
  for (size_t i = 0; i < len; ++i) {
    std::cout << values[i] << ",";
  }
  std::cout << "]";
}

int main(int argc, char *argv[]) {
  energonsoftware::InputValues input{6, 7, 8};
  auto output = energonsoftware::compute_values(input, 3);

  std::cout << "C++ says compute_values("
            << energonsoftware::InputValues_to_string(input).c_str()
            << ") = " << energonsoftware::OutputValues_to_string(output).c_str()
            << std::endl;

  int64_t values[] = {1, 2, 3, 4, 5};

  std::cout << "Array before: ";
  print_array(values, 5);
  std::cout << std::endl;

  energonsoftware::reorder_values(rust::Slice<int64_t>(values, 5));

  std::cout << "Array after: ";
  print_array(values, 5);
  std::cout << std::endl;

  return 0;
}
