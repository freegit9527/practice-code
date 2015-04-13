/*
 * =====================================================================================
 *       Filename : longInt.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 09:23
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdio>
#include <cstdlib>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	unsigned long int a;
	unsigned int long b;

	a = 1 << 31;
	b = 1 << 31;
	cout << "a = " << a << endl; 
	cout << "b = " << b << endl;                  /* equal */

	cout << "sizeof a = " << sizeof(a) << endl;
	cout << "sizeof b = " << sizeof(b) << endl;   /* both are 8 */

	unsigned long long int c;
	unsigned int long long d;
	cout << "sizeof c = " << sizeof(c) << endl;
	cout << "sizeof d = " << sizeof(d) << endl;   /* both are 8 */

	cout << "sizeof long long int = "  << sizeof (long long int) << endl; /* output is 8 */

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

