/*
 * =====================================================================================
 *       Filename : matrix_chain.c
 *    Description : Matrix chain multiplication problem
 *    Version     : 0.1
 *        Created : 01/10/15 21:17
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

void pathPrint ( int start, int end, int path[][101] );

	int
main ( int argc, char *argv[] )
{
	freopen ( "matrix_chain.txt", "r", stdin );
	int n, i, j, k, p[101],
			path[101][101], _a, s[101][101], L;

	scanf ( "%d", &n );
	for ( i = 0; i <= n; ++i ) {
		scanf ( "%d", &p[i] );
	}

	for ( i = 1; i <= n; ++i ) {
		s[i][i] = 0;
	}

	for ( L = 2; L <= n; ++L ) {
		for ( i = 1; i < n; ++i ) {
			j = i + L - 1;
			s[i][j] = INT_MAX;
			for ( k = i; k < j; ++k ) {
				_a = s[i][k] + s[k+1][j] + p[i-1] * p[k] * p[j];
				if ( _a < s[i][j] ) {
					s[i][j] = _a;
					path[i][j] = k;
				}
			}
		}
	}
	printf ( "result = %d\n", s[1][n] );
	printf ( "construction is: " );
	pathPrint ( 1, n, path );
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*  Name:  pathPrint
 *  Description:  print the path
 */
	void
pathPrint ( int start, int end, int path[][101] )
{
	if ( start == end ) {
		printf ( "A%d", start );
		return;
	}
	printf ( "(" );
	int k = path[start][end];
	pathPrint ( start, k, path );
	pathPrint ( k + 1, end, path );
	printf ( ")" );

	return ;
}		/* -----  end of function pathPrint  ----- */
