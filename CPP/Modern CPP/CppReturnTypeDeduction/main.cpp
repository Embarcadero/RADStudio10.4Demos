#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <string>
#include <memory>

class employee {
    // Lots of code here
};

struct person_id {
    std::string first_name;
    std::string last_name;
};

class employees {
public:
    auto find_employee(const std::string& name) { return 1; }
};

int return_an_int() {
    return 1;
}

auto return_something() {
    return 1;
}

// The following will give a compiler error, because int and float are different types
//auto returnConfusion() {
//    if (std::rand() %2 == 0) {
//        return -1;
//    } else {
//        return 3.14159;
//    }
//}
int main() {
    auto i{ return_an_int() };

    auto j{ return_something() };

    // Example of a method with multiple return points, each with different types - an error
    // auto k {returnConfusion()};

    auto employee_list{ std::make_unique<employees>() };

    auto person = employee_list->find_employee("Jane Smith");

    return 0;
}
