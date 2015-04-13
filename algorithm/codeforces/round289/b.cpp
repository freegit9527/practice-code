/*
 * =====================================================================================
 *       Filename : b.cpp
 *    Description : 
 *    Version     : 
 *        Created : 01/31/15 20:42
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>
int a[101];
	int
main ( int argc, char *argv[] )
{
//	freopen("in.txt", "r", stdin);
	int n, k, i, _min, _max, gap, tmp, j;
	while (scanf ( "%d%d", &n, &k ) != EOF) {
		_min = 101;
		_max = -1;
		for (i = 1; i<= n; ++i) {
			scanf ( "%d", &a[i] );
			if (_min > a[i]) {
				_min = a[i];
			}
			if (_max < a[i]) {
				_max = a[i];
			}
		}
		gap = _max - _min;
		if (gap > k) {
			printf ( "NO\n" );
		}
		else {
			printf ( "YES\n" );
			for (i = 1; i <= n; ++i) {
				tmp = 1;
				for (j = 1; j < a[i]; ++j) {
					printf ( "%d ", tmp );
					tmp += 1;
					if (tmp > k) {
						tmp = 1;
					}
				}
				printf ( "%d\n", tmp );
			}
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

