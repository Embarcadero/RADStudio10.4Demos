#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <algorithm>
#include <cstring>
#include <iostream>
#include <string>
#include <string_view>

// string_view
// Unified way to view a string (memory and length) - without owning it
// No allocation
std::size_t parse(std::string_view str) {
    return std::count(str.begin(), str.end(), 'e');
}

int _tmain(int argc, _TCHAR *argv[]) {
    const std::string str = "hello world";
    const char* c = "Rio de Janeiro";

    std::cout << "Occurrences of letter 'e': " << parse(std::string_view(str.data(), str.length())) << std::endl;
    std::cout << "Occurrences of letter 'e': " << parse(std::string_view(c, strlen(c))) << std::endl;

    return 0;
}
