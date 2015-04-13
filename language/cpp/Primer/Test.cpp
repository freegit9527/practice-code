/*
 * =====================================================================================
 *       Filename : Test.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/19/15 15:00
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <stdexcept>
#include <exception>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	
#ifdef  NDEBUG
	cout << "define NDEBUG" << endl;
#else      /* -----  not NDEBUG  ----- */
		cout << "Not define NDEBUG"  << endl;
#endif     /* -----  not NDEBUG  ----- */

		cerr << "Error: " << __FILE__ << endl
			  << "At line: " << __LINE__  << endl 
			 << "Compiled on " << __DATE__
			  << " at " << __TIME__ << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

