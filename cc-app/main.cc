#include <iostream>

extern "C" int32_t compute_value_a(int32_t, int32_t);

int main(int argc, char *argv[])
{
    const int32_t x = 6;
    const int32_t y = 7;

    std::cout << "C++ says compute_value_a(" << x << ", " << y << ") = " << compute_value_a(x, y) << std::endl;
    return 0;
}
