/*
 * =====================================================================================
 *       Filename : Assembly-line-shcedule.c
 *    Description : first dynamic programming problem
 *    Version     : 0.1
 *        Created : 01/10/15 17:08
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void pathPrint(int line, int index, int path[][101]);

	int
main ( int argc, char *argv[] )
{
	freopen("Assembly-line-schedule.txt",
			"r", stdin);
	int i, j, n, s[3][101], t[3][101], a[3][101],
			path[3][101], e[3], x[3], _a, _b, endStation, 
			result;

	result = 0;
	memset (path, 0, sizeof(path));
	memset ( s, 0, sizeof(s) );

//	printf ( "Input n: " );
	scanf ( "%d", &n );

//	printf ( "Input e1 and e2: " );
	scanf ( "%d %d", e + 1, e + 2 );

//	printf ( "\nInput array a:\n" );
	for ( i = 1; i <= 2; ++i ) {
		for ( j = 1; j <= n; ++j ) {
			scanf ( "%d", &a[i][j] );
		}
	}

//	printf ( "\nInput array t:\n" );
	for ( i = 1; i <= 2; ++i ) {
		for ( j = 1; j < n; ++j ) {
			scanf ( "%d", &t[i][j] );
		}
	}

//	printf ( "Input array x: " );
	scanf ( "%d %d", x + 1, x + 2 );

	s[1][1] = e[1];
	s[2][1] = e[2];

	path[1][1] = 1;
	path[2][1] = 2;

	for ( j = 2; j <= n; ++j ) {
				_a = s[1][j-1] + a[1][j-1];
				_b = s[2][j-1] + a[2][j-1] + t[2][j-1];
				if ( _a < _b ) {
					s[1][j] = _a;
					path[1][j] = 1;
				}
				else {
					s[1][j] = _b;
					path[1][j] = 2;
				}
				_a = s[1][j-1] + a[1][j-1] + t[1][j-1];
				_b = s[2][j-1] + a[2][j-1];
				if ( _a < _b ) {
					s[2][j] = _a;
					path[2][j] = 1;
				}
				else {
					s[2][j] = _b;
					path[2][j] = 2;
				}
	}


	_a = s[1][n] + x[1] + a[1][n];
	_b = s[2][n] + x[2] + a[2][n];

	if ( _a < _b ) {
		endStation = 1;
		result = _a;
	}
	else {
		endStation = 2;
		result = _b;
	}

	printf ( "minimum time is: %d\n", result );
	printf ( "The path is: " );
	pathPrint ( endStation, n, path );
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*  Name:  pathPrint
 *  Description:  print the path
 */
	void
pathPrint ( int line, int index, int path[][101] )
{
	if ( 1 == index ) {
		printf ( "a[%d][%d] ", line, index );
		return;
	}
	pathPrint ( path[line][index], index - 1, path );
	printf ( "a[%d][%d] ", line, index );

	return ;
}		/* -----  end of function pathPrint  ----- */
