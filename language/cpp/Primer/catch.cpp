/*
 * =====================================================================================
 *       Filename : catch.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/18/15 20:38
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <stdexcept>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	int a, b;
	cout << "Enter two numbers: ";
	while ( cin >> a >> b ) {
		try {
			cout << "a = " << a << " b = " << b << endl; 
			if ( a != b ) {
				throw runtime_error("a != b");
			}
			else {
				cout << "a == b"  << endl;
			}
		}
		catch (runtime_error err) {
			cout << err.what()
				 << "\nTry Again? Enter y or n: ";
			char c;
			cin >> c;

			if ( cin && 'n' == c ) {
				break;
			}
		}
		cout << "Enter two numbers: ";
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
