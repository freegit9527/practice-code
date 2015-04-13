/*
 * =====================================================================================
 *       Filename : 6.27.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 15:12
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cassert>
#include <cstdlib>
#include <cstdio>
#include <string>

using namespace std;

	int
main ( int argc, char *argv[] )
{
	string s;

	while ( cin >> s && s != "caught" ) {
		assert(cin);
		cout << s << endl;
	}
	cout << "END"  << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

