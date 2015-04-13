/*
 * =====================================================================================
 *       Filename : longest_increasing_sequence.c
 *    Description : get longest increasing sequence
 *    Version     : 0.1
 *        Created : 01/11/15 16:23
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void printPath ( int i, int path[], int x[] );

	int
main ( int argc, char *argv[] )
{
	freopen ( "longest_increasing_sequence.txt", "r",
			stdin);
	int n, i, j, _a, x[101], path[101], s[101],
			index;

	memset ( path, 0, sizeof(path) );
	scanf ( "%d", &n );
	for ( i = 1; i <= n; ++i ) {
		scanf ( "%d", &x[i] );
	}

	for ( i = 1; i <= n; ++i ) {
		s[i] = 1;
	}

	for ( i = 1; i <= n; ++i ) {
		for ( j = 1; j < i; ++j ) {
			if ( x[i] > x[j] ) {
				_a = s[j] + 1;
				if ( _a > s[i] ) {
					s[i] = _a;
					path[i] = j;
				}
			}
		}
	}

	index = 1;
	for ( i = 2; i <= n; ++i ) {
		if ( s[i] > s[index] ) {
			index = i;
		}
	}

	printf ( "length of longest increasing sequence is: %d\n", s[index] );
	printf ( "The result is: " );
	printPath ( index, path, x );
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*  Name:  printPath
 *  Description:  print the result
 */
	void
printPath ( int i, int path[], int x[] )
{
	if ( 0 == i ) {
		return;
	}

	printPath ( path[i], path, x );
	printf ( "%d ", x[i] );
	return ;
}		/* -----  end of function printPath  ----- */
