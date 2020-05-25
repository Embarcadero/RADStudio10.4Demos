#include "main.h"

#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <algorithm>
#include <optional>
#include <vector>

// Template auto
template<auto V>
struct constant {
    static constexpr auto value = V;
};

// Nested namespaces
namespace foo::bar::z {
    class something {
    };
}

// New attributes
// Can attach to structs/classes too, to make the type undiscardable
[[nodiscard]] int must_use_return_value(int a) {
    return a * 2;
}

int _tmain(int argc, _TCHAR* argv[]) {
    auto v1 = constant<123>::value;
    auto v2 = constant<'z'>::value;

    foo::bar::z::something s;

    int v3 = (must_use_return_value(i), 5);

    // optional: may hold a value
    std::optional<int> a(5);
    std::optional<int> b;

    if (a.has_value()) {
        int z = *a + b.value_or(0); // *deref, or .value()
    }
    // also std::variant (a union) and std::any

    // Parallel STL algorithms
    std::vector<int> vec{ 1, 10, 8, 7, 15, 4, 5, 3 };
    std::sort(std::execution::par, vec.begin(), vec.end());

    return 0;
}
