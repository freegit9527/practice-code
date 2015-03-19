/*
 * =====================================================================================
 *       Filename : bitset.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 09:10
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <bitset>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	cout << (1ul<<27) << endl;                    /* 134217728 */
	cout << 1ul << 27 << endl;                    /* 127 */
	cout << "******************** " << endl;

	bool status;
	bitset<30> bitset_quizl;
	unsigned int long int_quizl = 0;

	// set NO.27 
	bitset_quizl.set(27);
	int_quizl |= (1ul << 27);
	status = bitset_quizl[27];
	if ( status ) {
		cout << "NO.27 passed." << endl;
	}
	cout << "bitset_quizl is: " << bitset_quizl << endl;

	// reset NO.27 
	bitset_quizl.reset(27);
	int_quizl &= ~(1ul << 27);
	status = bitset_quizl[27];
	cout << "NO.27 failed." << endl;

	cout << "bitset_quizl is: " << bitset_quizl << endl;
	cout << "sizeof bitset_quizl = "  << sizeof(bitset_quizl) << endl; /* output 8 */

	// if we what to get sizeof bit_set, just:
	cout << "bitset_quizl.size is " << bitset_quizl.size() << endl;

	// bitset::to_ulong function

	bitset<4> foo;                                /* foo: 0000 */
	foo.set();                                    /* foo: 1111 */
	cout << foo << " as an integer is: " << foo.to_ulong() << endl;

	// bitset::to_string function
	// But what does this mean? traits_type and allocator_type?
	// I have to figure it out...
	string mystr = foo.to_string<char, string::traits_type, 
				 string::allocator_type>();
	cout << "mystr : " << mystr << endl;

	bitset<16> foo1;
	bitset<16> bar(0xfa2);
	bitset<16> baz(string("0101111001"));

	cout << "foo1: "  << foo1 << endl;
	cout << "bar: "  << bar << endl;
	cout << "baz: "  << baz << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

