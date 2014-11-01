/*
 * =====================================================================================
 *       Filename : getcwdpathmax.c
 *    Description : 
 *    Version     : 
 *        Created : 10/31/14 22:42
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include <unistd.h>
#ifndef PATH_MAX
#define PATH_MAX 255
#endif


	int
main ( int argc, char *argv[] )
{
	char mycwd[PATH_MAX];

	if ( NULL == getcwd(mycwd, PATH_MAX) ) {
		perror("Failed to get current working directory");
		return 1;
	}
	printf ( "Current working directory: %s\n", mycwd );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

