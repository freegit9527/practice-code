/*
 * =====================================================================================
 *       Filename : sizeof.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 10:59
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cctype>

using namespace std;


	int
main ( int argc, char *argv[] )
{
#ifdef  NDEBUG
	cout << "Hello..." << endl;
#else      /* -----  not NDEBUG  ----- */
		cout << "World..."  << endl;
#endif     /* -----  not NDEBUG  ----- */

#ifdef NDEBUG
		cout << "This is the second Hello...=="  << endl;
#endif

	int a;

	cout << sizeof (int) << endl;                 /* must have braces */
	a = 1;
	++a;
	cout << sizeof a << endl;                     /* can ommit braces */


		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

