#ifdef _WIN32
#include <tchar.h>
#else
typedef char _TCHAR;
#define _tmain main
#endif

#include <string>
#include <iostream>
#include <tuple>

// Demonstrate structured bindings - here, a method might in the past
// have had a bool success result, and an error param written to.
// Now, can return both (all error info) as one tuple, bound automatically
// to local vars through the auto keyword (much nicer than std::tie
// in C++11/14)

auto connect_to_network() {
	// The connection could succeed, or fail with an error message
	// Here, mimic it failing
	bool connected{ false }; // failed!

	std::string str_error{ "404: resource not found" };

	return std::make_tuple(connected, str_error);
}

int _tmain(int argc, _TCHAR* argv[]) {
	auto [connected, str_error] = connect_to_network();

	if (!connected) {
		std::cout << str_error;
	}

	return 0;
}
