/*
 * =====================================================================================
 *       Filename : a.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/17/15 15:28
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>

	int
main ( int argc, char *argv[] )
{
//	freopen("a.txt", "r", stdin);
	int n, m;
	while ( ~scanf ( "%d%d", &n, &m ) ) {
		int toggle = 1, cnt = n / 2;
		while ( cnt-- ) {
			
			for ( int i = 0; i < m; ++i ) {
				printf ( "#" );
			}
			printf ( "\n" );
			if ( toggle ^ 1 ) {
				printf ( "#" );
				for ( int i = 0; i < m - 1; ++i ) {
					printf ( "." );
				}
				printf ( "\n" );
			}
			else {
				for ( int i = 0; i < m - 1; ++i ) {
					printf ( "." );
				}
				printf ( "#" );
				printf ( "\n" );
			}
			toggle ^= 1;

		}
		for ( int i = 0; i < m; ++i ) {
			printf ( "#" );
		}
		printf ( "\n" );
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

