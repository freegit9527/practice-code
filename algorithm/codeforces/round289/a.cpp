/*
 * =====================================================================================
 *       Filename : a.cpp
 *    Description : 
 *    Version     : 
 *        Created : 01/31/15 20:06
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>

	int
main ( int argc, char *argv[] )
{
	int a[11][11];
	int n, i, j;
	for (i = 1; i <= 10; ++i) {
		a[i][1] = a[1][i] = 1;
	}
	for (i = 2; i <= 10; ++i) {
		for (j = 2; j <= 10; ++j) {
			a[i][j] = a[i-1][j] + a[i][j-1];
		}
	}
	while (scanf ( "%d", &n )!=EOF){
		printf ( "%d\n", a[n][n] );
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

