/*
 * =====================================================================================
 *       Filename : contest.cpp
 *    Description : 
 *    Version     : 
 *        Created : 01/12/15 17:01
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <algorithm>
#include <iostream>
#include <cstdlib>
using namespace std;


	int
main ( int argc, char *argv[] )
{
	int a, b, c, d;
	cin >> a >> b >> c >> d;

	int misha = max(3 * a / 10, a - a / 250 * c);
	int vasya = max(3 * b / 10, b - b / 250 * d);
	if ( misha > vasya ) {
		printf ( "Misha\n" );
	}
	else if ( misha < vasya ) {
		printf ( "Vasya\n" );
	}
	else {
		printf ( "Tie\n" );
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

