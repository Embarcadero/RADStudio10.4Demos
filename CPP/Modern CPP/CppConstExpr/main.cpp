#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <cmath>
#include <iostream>
#include <memory>

constexpr int method_call(int a, int b) {
    return a * b;
}

constexpr auto degrees_to_radians(const double degrees) {
    return degrees * (M_PI / 180.0);
}

constexpr int sum(int n) {
    if (n > 0) {
        return n + sum(n - 1);
    }

    return n;
}

template<typename T>
auto get_value(T t) {
    if constexpr (std::is_pointer_v<T>) {
        return *t;
    } else {
        return t;
    }
}

int _tmain(int argc, _TCHAR* argv[]) {
    constexpr int i = 1 + 2;
    constexpr int j = method_call(5, 10);

    constexpr auto radians = degrees_to_radians(90);
    constexpr auto sum_one_to_ten = sum(10);

    int a = 5;
    int* pa = &a;

    auto value_a = get_value(a);
    auto value_pa = get_value(pa);

    std::cout << value_a << std::endl;
    std::cout << value_pa << std::endl;

    return 0;
}
