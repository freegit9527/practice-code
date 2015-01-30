/*
 * =====================================================================================
 *       Filename : largest_sum_contiguous_subarray.cpp
 *    Description : largest sum contiguous subarray. time: O(N). 
 *    							space: O(1)
 *    Version     : 0.2
 *        Created : 01/13/15 09:08
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX(a,b) ((a) > (b) ? (a) : (b))

int a[101];
	int
main ( int argc, char *argv[] )
{
	freopen("largest_sum_contiguous_subarray.txt",
			"r", stdin);
	int n, i, cur, res;

	scanf ( "%d", &n );
	for ( i = 1; i <= n; ++i ) {
		scanf ( "%d", &a[i] );
	}

	// we notice that s[i] is used only once.
	// so we need not use array s at all.
	cur = a[1];
	res = cur;
	for ( i = 2; i <= n; ++i ) {
		cur = MAX(a[i], cur + a[i]);
		res = MAX(cur, res);
	}

	printf ( "%d\n", res );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

