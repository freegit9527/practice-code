/*
 * =====================================================================================
 *       Filename : longest_increasing_sequence_nlogn.c
 *    Description : use nlogn complexity to get longest increasing sequence.
 *    Version     : 0.1
 *        Created : 01/11/15 17:29
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void binary_replace ( int a[], int t, int len );

	int
main ( int argc, char *argv[] )
{
	freopen ( "longest_increasing_sequence.txt", "r", stdin );
	int n, x[101], y[101], i, len;

	scanf ( "%d", &n );
	for ( i = 1; i <= n; ++i ) {
		scanf ( "%d", &x[i] );
	}

	memset ( y, 0, sizeof(y) );
	len = 1;
	y[1] = x[1];

	for ( i = 2; i <= n; ++i ) {
		if ( x[i] > y[len] ) {
			y[++len] = x[i];
		}
		else if ( x[i] < y[len] ) {
			binary_replace ( y, x[i], len );
		}
	}

	printf ( "length of longest increasing sequence is: %d\n", len );
	for ( i = 1; i <= len; ++i ) {
		printf ( "%d ", y[i] );
	}
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*  Name:  binary_replace
 *  Description:  replace the first i which less or equal 
 *  to t. 
 */
	void
binary_replace ( int a[], int t, int len )
{
	int left = 1, right = len,
			mid;
	// right is the first index which a[right] >= t
	while ( left < right ) {
		mid = (left + right) / 2;
		if ( a[mid] < t ) {
			left = mid + 1;
		}
		else if ( a[mid] == t ) {
			right = mid;
			break;
		}
		else {
			right = mid;
		}
	}

	a[right] = t;
	return ;
}		/* -----  end of function binary_replace  ----- */
