/*
 * =====================================================================================
 *       Filename : spoj740trt.cpp
 *    Description : a dynamic problem
 *    Version     : 0.1
 *        Created : 01/12/15 00:05
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio>
#include <stdlib>

int s[2001][2001];
int a[2001];

	int
main ( int argc, char *argv[] )
{
	int i, len, N, start, end, year, _a,
			_b;
	scanf ( "%d", &N );
	for ( i = 1; i <= N; ++i ) {
		scanf ( "%d", &a[i] );
	}

	for ( len = 1; len <= N; ++len ) {
		for ( start = 1; start <= N - len; ++start ) {
			end = start + len;
			year = N - len;
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

