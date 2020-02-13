#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <iostream>
#include <string>

int _tmain(int argc, _TCHAR* argv[]) {
    std::string hello = "hello";
    std::string world = "world";

    auto add_things = [](auto a, auto b) { return a + b; };

    auto i = add_things(1, 2);
    auto s = add_things(hello, world);

    std::cout << i << std::endl;
    std::cout << s << std::endl;

    return 0;
}
