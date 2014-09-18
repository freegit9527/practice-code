/*
 * =====================================================================================
 *       Filename : fuJia3.cpp
 *    Description : Find the length of the longest substring in another str
 *    							This algorithm is O(M*N) where M and N are the lengthes of the 
 *    							two strings.
 *    Version     : 0.1
 *        Created : 08/29/14 19:43
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <string>
#include <cstring>
using namespace std;
char query[100000];
char text[100000];

int getMaxLength(char qu[], char te[]) 
{
	int lenqu = strlen(qu), lente = strlen(te);
	int res_length = 0;
	int i, j, k, prei, templen = 0;
	for ( i = 0; i < lente; ++i ) {
		prei = i;
		j = 0;
		while (j < lenqu) {
			k = j;
			while (qu[k] == te[prei]) {
				++k; 
				++prei;
				++templen;
			}
			if (res_length < templen) {
				res_length = templen;
			}
			++j;
			templen = 0;
			prei = i;
		}
	}
	return res_length;
}
/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
//	freopen("in.txt", "r", stdin);
	while (~scanf("%s%s", query, text)) {
		printf ( "%d\n", getMaxLength(query, text) );
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

