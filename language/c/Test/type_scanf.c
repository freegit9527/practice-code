/*
 * =====================================================================================
 *       Filename : type_scanf.c
 *    Description : This program outputs differently on different systems.
 *    Version     : 
 *        Created : 11/12/14 22:45
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
main()
{
	int i;
	char c;

<<<<<<< HEAD
	for ( i = 0; i < 5; ++i ) {
		scanf ( "%d", &c );
		printf ( "%d\n", i );
	}
=======
//	for ( i = 0; i < 5; ++i ) {
//		scanf ( "%d", &c );
//		printf ( "%d ", i );
//	}
//	printf ( "%d %d\n", (-1)>>1, -1/2 );
	char *p = NULL;
	printf ( "%d\n", *p );
>>>>>>> 495d993c78e4135fc1d89baff14cc4f3144eb20b
	printf ( "\n" );
}

