/*
 * =====================================================================================
 *       Filename : longest_common_subsequence.c
 *    Description : longest common subsequence problem. The third dynamic 
 *    							problem
 *    Version     : 0.1
 *        Created : 01/11/15 10:41
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printPath ( int i, int j, int path1[][101], int path2[][101], int line );
void printResult ( int i, int j, int s[][101], int x[], int y[] );

	int
main ( int argc, char *argv[] )
{
	freopen( "longest_common_subsequence.txt", "r", stdin );
	int n, m, x[101], y[101], i,
			j, path1[101][101], path2[101][101],
			_a, _b, s[101][101];

	memset ( path1, 0, sizeof(path1) );
	memset ( path2, 0, sizeof(path2) );
	memset ( s, 0, sizeof(s) );

	scanf ( "%d %d", &n, &m );

	for ( i = 1; i <= n; ++i ) {
		scanf ( "%d", &x[i] );
	}
	for ( i = 1; i <= m; ++i ) {
		scanf ( "%d", &y[i] );
	}

	for ( i = 1; i <= n; ++i ) {
		for ( j = 1; j <= m; ++j ) {
			if ( x[i] == y[j] ) {
				s[i][j] = 1 + s[i-1][j-1];
				path1[i][j] = i;
				path2[i][j] = j;
			}
			else {
				_a = s[i-1][j];
				_b = s[i][j-1];

				if ( _a < _b ) {
					s[i][j] = _b;
					path1[i][j] = path1[i][j-1];
					path2[i][j] = path2[i][j-1];
				}
				else {
					s[i][j] = _a;
					path1[i][j] = path1[i-1][j];
					path2[i][j] = path2[i-1][j];
				}
			}
		}
	}
	printf ( "Length of longest common sequence is: %d\n", s[n][m] );

	printf ( "path of line 1 is: " );
	printPath ( n, m, path1, path2, 1);
	printf ( "\n" );

	printf ( "path of line 2 is: " );
	printPath ( n, m, path1, path2, 2);
	printf ( "\n" );

	printf ( "Print a result: " );
	printResult ( n, m, s, x, y );
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*  Name:  printPath
 *  Description:  print the path. print the index of each sequence 
 *  chosen.
 */
	void
printPath ( int i, int j, int path1[][101], int path2[][101], int line )
{
	int k1, k2;
	if ( 0 == i || 0 == j ) {
		return;
	}
	k1 = path1[i][j];
	k2 = path2[i][j];
	printPath ( k1 - 1, k2 - 1, path1, path2, line );
	if ( 1 == line ) {
		printf ( "%d ", k1 );
	}
	else {
		printf ( "%d ", k2 );
	}
	return ;
}		/* -----  end of function printPath  ----- */


/*  Name:  printResult
 *  Description:  print the an answer.
 */
	void
printResult ( int i, int j, int s[][101], int x[], int y[] )
{
	if ( 0 == i || 0 == j ) {
		return;
	}

	if ( x[i] == y[j] ) {
		printResult ( i - 1, j - 1, s, x, y );
		printf ( "%d ", x[i] );
	}
	else if ( s[i-1][j] >= s[i][j-1] ) {
		printResult ( i - 1, j, s, x, y );
	}
	else {
		printResult ( i, j - 1, s, x, y );
	}
	return ;
}		/* -----  end of function printResult  ----- */
