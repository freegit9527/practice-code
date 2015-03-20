/*
 * =====================================================================================
 *       Filename : 6.23.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 09:31
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdio>
#include <exception>
#include <cstdlib>
#include <stdexcept>
#include <bitset>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	bitset<20> a_bit;
	try {
		a_bit.set();
		unsigned long int a_long = a_bit.to_ulong();
		if ( a_bit.size() > (8 * sizeof(unsigned long int)) ) {
			throw overflow_error("a_long is overflowed!");
		}
		cout << a_long << endl;
	}
	catch ( overflow_error e ) {		/* handle exception: */
		cout << e.what() << endl;
	}
	catch (...) {		/* handle exception: unspecified */
	}


		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

