#include <iostream>
#include "ffi.h"

int main(int argc, char *argv[])
{
    energonsoftware::InputValues input{6, 7, 8};
    auto output = energonsoftware::compute_values(&input, 3);

    std::cout << "C++ says compute_values(" << energonsoftware::InputValues_to_string(&input) << ") = "
              << energonsoftware::OutputValues_to_string(&output) << std::endl;

    return 0;
}
