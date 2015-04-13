/*
 * =====================================================================================
 *       Filename : TEST.cpp
 *    Description : just for test
 *    Version     : 0.1
 *        Created : 08/10/14 09:40
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <cstring>
using namespace std;

/* 
 * ===  FUNCTION  ======================================================================
 *         Name: main
 * =====================================================================================
 */

	int
main ( int argc, char *argv[] )
{
	char sentence[] = "This is a sample string";
	char *pch;
	printf ( "Looking for the 's' character in \"%s\"...\n", sentence );
	pch = strchr(sentence, 's');
	while ( NULL != pch ) {
		printf ( "found at %d\n", pch - sentence + 1 );
		pch = strchr(pch + 1, 's');
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

