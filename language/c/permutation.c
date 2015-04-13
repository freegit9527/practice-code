/*
 * =====================================================================================
 *       Filename : permutation.c
 *    Description : generate permutationt
 *    Version     : 0.1
 *        Created : 10/09/14 12:07
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
int a[6];
int use[6];
const int N = 4;
void dfs(int);
void dfs(int k)
{
	int i;
	if (k > N) {
		for (i = 1; i <= N; ++i) {
			printf ( "%d ", a[i] );
		}
		printf ( "\n" );
	}
	for (i = 1; i <= N; ++i) {
		if (0 == use[i]) {
			use[i] = 1;
			a[k] = i;
			dfs(k + 1);
			use[i] = 0;
		}
	}
}


	int
main ( int argc, char *argv[] )
{
	dfs(1);

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
