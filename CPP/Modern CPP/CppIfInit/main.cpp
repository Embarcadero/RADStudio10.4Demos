#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <string>

int a = 5;

int* get_pointer() {
    return &a;
}

std::string get_string() {
    return "hello";
}

int _tmain(int argc, _TCHAR* argv[]) {
    // Pointer is convertible to bool
    if (int* p = get_pointer()) {
        // Do something with p
    }

    // Needs to have a boolean expression
    if (std::string s = get_string(); s.length() > 0) {
        //
    }

    return 0;
}
