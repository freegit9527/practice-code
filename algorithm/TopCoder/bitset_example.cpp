/*
 * =====================================================================================
 *       Filename : bitset_example.cpp
 *    Description : bitset example
 *    Version     : 
 *        Created : 03/20/15 12:58
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <bitset>
#include <iostream>
#include <cstdlib>
#include <cstdio>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	bitset<8> foo(string("10110011"));

	cout << foo << " has " << 
		foo.count() << " ones and "  << 
		(foo.size() - foo.count())  << " zeros.\n" ;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

