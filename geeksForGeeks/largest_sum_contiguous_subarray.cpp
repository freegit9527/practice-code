/*
 * =====================================================================================
 *       Filename : largest_sum_contiguous_subarray.cpp
 *    Description : largest sum contiguous subarray
 *    Version     : 0.1
 *        Created : 01/13/15 09:08
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int a[101], s[101];
	int
main ( int argc, char *argv[] )
{
	freopen("largest_sum_contiguous_subarray.txt",
			"r", stdin);
	int n, i, _a, _b;

	scanf ( "%d", &n );
	for ( i = 1; i <= n; ++i ) {
		scanf ( "%d", &a[i] );
		s[i] = a[i];
	}

	// we notice that s[i] is used only once.
	// so we need not use array s at all.
	for ( i = 2; i <= n; ++i ) {
		_a = s[i] + s[i-1];
		_b = s[i];
		if ( _a > _b ) {
			s[i] = _a;
		}
	}

	_a = s[1];
	for ( i = 2; i <= n; ++i ) {
		if ( _a < s[i] ) {
			_a = s[i];
		}
	}

	printf ( "%d\n", _a );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

