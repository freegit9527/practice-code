/*
 * =====================================================================================
 *       Filename : lcs.cpp
 *    Description : http://www.geeksforgeeks.org/dynamic-programming-set-1/ 
 *    							memoization version of longest common sequence
 *    Version     : 
 *        Created : 01/22/15 15:52
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstring>
#include <cstdlib>

int s[200][200];
int x[8] = {1, 0, 0, 1, 0, 1, 0, 1},
			y[9] = {0, 1, 0, 1, 1, 0, 1, 1, 0};
/*  Name:  lcs
 *  Description:  
 */
	int
lcs ( int i, int j )
{
	if ( -1 == i || -1 == j ) {
		return 0;
	}
	if ( -1 != s[i][j] ) {
		return s[i][j];
	}
	if ( x[i] == y[j] ) {
		s[i][j] = 1 + lcs(i - 1, j - 1);
	}
	else {
		s[i-1][j] = lcs(i-1, j);
		s[i][j-1] = lcs(i, j-1);
		if ( s[i-1][j] > s[i][j-1] ) {
			s[i][j] = s[i-1][j];
		}
		else {
			s[i][j] = s[i][j-1];
		}
	}
	return s[i][j];
}		/* -----  end of function lcs  ----- */
	int
main ( int argc, char *argv[] )
{
	memset(s, -1, sizeof(s));
	int len = lcs(8-1, 9-1);
	printf ( "len = %d\n", len );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

