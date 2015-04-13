/*
 * =====================================================================================
 *       Filename : vmtest.c
 *    Description : two single process are individual for address
 *    Version     : 
 *        Created : 11/15/14 12:34
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>

	int
main ( int argc, char *argv[] )
{
	int hoge;
	char buf[256];

	printf ( "&hoge...%p\n", &hoge );

	printf ( "Input initial value.\n" );
	fgets(buf, sizeof(buf), stdin);
	sscanf(buf, "%d", &hoge);

	for ( ; ;  ) {
		printf ( "hoge...%d\n", hoge );
		getchar();
		++hoge;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

