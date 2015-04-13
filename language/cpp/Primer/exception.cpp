/*
 * =====================================================================================
 *       Filename : exception.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 10:38
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <exception>
#include <iostream>
#include <cstdlib>
#include <typeinfo>

using namespace std;

class Polymorphic
{
	virtual void member(){}
};

	int
main ( int argc, char *argv[] )
{
	try {
		Polymorphic * str = 0;
		typeid(*str);
	}
	catch ( exception &e ) {		/* handle exception: */
		cerr << "exception caught: "  << 
			e.what() << endl;
	}
	// The following is legal!
	catch (...) {		/* handle exception: unspecified */
	}


		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

