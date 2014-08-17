/*
 * =====================================================================================
 *       Filename : quick_sort.cpp
 *    Description : quick sort
 *    Version     : 0.1
 *        Created : 08/10/14 15:28
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>
int a[100];
/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  quick_sort
 *  Description:  my function of quick sort implementation
 * =====================================================================================
 */
	void
quick_sort ( int left, int right )
{
	if ( left >= right ) {
		return;
	}
	int i = left, j = right, tmp = a[left];
	while ( i <= j ) {
		while (a[j] > tmp) {
			--j;
		}
		while ( a[i] <= tmp ) {
			++i;
		}
		if ( i < j ) {
			int t = a[i];
			a[i] = a[j];
			a[j] = t;
		}
	}
	a[left] = a[j];
	a[j] = tmp;
	quick_sort(left, j - 1);
	quick_sort(j + 1, right);
	return ;
}		/* -----  end of function quick_sort  ----- */

/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	int n;
	freopen("quickSort.txt", "r", stdin);

	scanf ( "%d", &n );
	for ( int i = 0; i < n; ++i ) {
		scanf ( "%d", &a[i] );
	}
	quick_sort(0, n-1);
	for ( int i = 0; i < n; ++i ) {
		printf ( "%d ", a[i] );
	}
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
