/*
 * =====================================================================================
 *       Filename : triangle.cpp
 *    Description : triangle
 *    Version     : 0.1
 *        Created : 08/09/14 14:57
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
//#include <iostream>
//#include <cstdio>
//#include <cstdlib>
//#include <cmath>
#include <bits/stdc++.h>
using namespace std;

/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	for ( int i = 0; i < 7; ++i ) {
		for ( int j = 0; j < 4 - abs(i - 3); ++j ) {
			cout << "#"; 
		}
		cout << endl;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

