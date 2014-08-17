/*
 * =====================================================================================
 *       Filename : bubblesort.cpp
 *    Description : bubble sort
 *    Version     : 0.1
 *        Created : 08/10/14 12:29
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>

/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	int n;
	int a[100];
	scanf ( "%d", &n );
	for ( int i = 0; i < n; ++i ) {
		scanf ( "%d", &a[i] );
	}
	for ( int i = 0; i < n - 1; ++i ) {
		for ( int j = 0; j < n - i - 1; ++j ) {
			if ( a[j] > a[j+1] ) {
				int t = a[j];
				a[j] = a[j+1];
				a[j+1] = t;
			}
		}
	}
	for ( int i = 0; i < n; ++i ) {
		printf ( "%d ", a[i] );
	}
	printf ( "\n" );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

