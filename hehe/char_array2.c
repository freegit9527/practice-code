/*
 * =====================================================================================
 *       Filename : char_array2.c
 *    Description : strcpy
 *    Version     : 0.1
 *        Created : 08/09/14 19:07
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	char str_a[20];
	strcpy(str_a, "Hello, world!\n");
	printf ( str_a );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

