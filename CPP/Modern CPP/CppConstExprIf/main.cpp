#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <string>

struct foo {
    int a;
    std::string b;
};

template<int N>
auto nth_member(foo const& foo) {
    if constexpr (N == 0) {
        return foo.a;
    } else if constexpr (N == 1) {
        return foo.b;
    }
}

int _tmain(int argc, _TCHAR* argv[]) {
    foo foo;

    auto a = nth_member<1>(foo);

    return 0;
}
