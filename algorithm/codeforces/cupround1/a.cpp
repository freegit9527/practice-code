/*
 * =====================================================================================
 *       Filename : a.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/29/15 01:22
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <cstdio>

using namespace std;

	int
main ( int argc, char *argv[] )
{
	double a, b, c;

	while ( cin >> a >> b >> c ) {
		double delta = b * b - 4 * a * c;
		if ( fabs(delta) < 1e-8 ) {
			cout << -1 * b / (2 * a) << endl;
		}
		else {
			cout << (-1 * b + sqrt(delta)) / (2 * a)  << " "
				 <<  (-1 * b - sqrt(delta)) / (2 * a) << endl;
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

