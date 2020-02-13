#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <memory>

class foo {
    //
};

int _tmain(int argc, _TCHAR* argv[]) {
    int i = 5;

    auto j = [&k = i]() {};

    std::unique_ptr<foo> ptr{ std::make_unique<foo>() };

    auto f = [z = std::move(ptr)]() {};

    return 0;
}
