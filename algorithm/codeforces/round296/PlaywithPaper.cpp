/*
 * =====================================================================================
 *       Filename : PlaywithPaper.cpp
 *    Description : problem A
 *    Version     : 
 *        Created : 03/20/15 17:55
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdio>
#include <algorithm>
#include <cstdlib>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	long long int a, b;
	while ( cin >> a >> b ) {
		long long int bigger, smaller;
		bigger = max(a, b);
		smaller = min(a, b);
		long long int tmp, sum = 0;
		while ( true ) {
			sum += bigger / smaller;
			tmp = bigger % smaller;
			bigger = smaller;
			smaller = tmp;

			if ( 0 == tmp ) {
				break;
			}
		}
		cout << sum << endl;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

