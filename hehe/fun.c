/*
 * =====================================================================================
 *       Filename : fun.c
 *    Description : jj
 *    Version     : j
 *        Created : 03/29/14 18:35
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : How about today?
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  fun
 *  Description:  f
 * =====================================================================================
 */
	int
fun ( int x )
{
	int countx = 0;
	while ( x ) {
		countx++;
		x = x & (x - 1);
	}
	return countx;
}		/* -----  end of function fun  ----- */


	int
main ( int argc, char *argv[] )
{
	printf("%d\n", fun(500));

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
