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
#include <stdio.h>
#include <stdlib.h>

int s[2001][2001];
int a[2001];

	int
main ( int argc, char *argv[] )
{
//	freopen ( "spoj740trt.txt", "r", stdin );
	int i, len, N, start, end, year, _a,
			_b;
	scanf ( "%d", &N );
	for ( i = 1; i <= N; ++i ) {
		scanf ( "%d", &a[i] );
	}

	for ( i = 1; i <= N; ++i ) {
		s[i][i] = N * a[i];
	}
	for ( len = 1; len <= N; ++len ) {
		for ( start = 1; start <= N - len; ++start ) {
			end = start + len;
			year = N - len;
			_a = s[start+1][end] + year * a[start];
			_b = s[start][end-1] + year * a[end];
			if ( _a > _b ) {
				s[start][end] = _a;
			}
			else {
				s[start][end] = _b;
			}
		}
	}
	printf ( "%d\n", s[1][N] );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

