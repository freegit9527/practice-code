/*
 * =====================================================================================
 *       Filename : catch.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 08:50
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <stdexcept>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	int a, b;

	cout << "Input two numbers: ";
	while ( cin >> a >> b ) {
		try {
			if ( a != b ) {
				throw runtime_error("a does not equal to b!");
			}
			cout << "a == b == " << a << endl; 
		}
		catch ( runtime_error err ) {		/* handle exception: */
			cout << err.what() << "\nTry again? (y or n) ";
			char c;
//			cin >> c;
			if ( cin >> c && 'n' == c ) {
				break;
			}
		}
		cout << "Input two numbers: ";
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

