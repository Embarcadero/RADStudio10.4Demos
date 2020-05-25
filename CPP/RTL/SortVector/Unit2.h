//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

#ifndef Unit2H
#define Unit2H
//---------------------------------------------------------------------------

#include <tchar.h>
#include <stdio.h>
#include <vector>
#include <iostream>
#include <algorithm>
#include <random>


template <typename X> void sort_vector(std::vector<X>& v)
{
	//a lambda expression used to perform an expected comparison as an anonymous function
	sort(v.begin(), v.end(), [] (const X& a, const X& b) {return a < b;});
}

template <typename X> void generate_numbers(std::vector<X>& v, int size = 10000)
{
	for(int i = 0; i <= size; i++)
	{
		v.push_back(rand());
	}
}
#endif
