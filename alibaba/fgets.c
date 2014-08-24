/*
 * =====================================================================================
 *       Filename : fgets.c
 *    Description : learn to use fgets
 *    Version     : 0.1
 *        Created : 03/07/14 19:06
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : How about today?
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>

	int
main ( int argc, char *argv[] )
{
	FILE *fp;
	char mystring[20];
	fp = fopen("fgets.txt", "r");
	if ( fp == NULL ) {
		perror("fail to open file.");
	}
	else {
		fgets(mystring, 6, fp);
//		puts(mystring);
		if ( fputs(mystring, stdout) == EOF ) {
			exit(1);
		}
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
