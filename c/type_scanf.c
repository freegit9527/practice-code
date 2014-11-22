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

	for ( i = 0; i < 5; ++i ) {
		scanf ( "%d", &c );
		printf ( "%d\n", i );
	}
	printf ( "\n" );
}

