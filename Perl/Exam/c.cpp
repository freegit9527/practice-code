/*
 * =====================================================================================
 *       Filename : c.cpp
 *    Description : 
 *    Version     : 
 *        Created : 10/19/14 19:36
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
//#include <bits/stdc++.h>
#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

/*  Name:  isleap
 *  Description:  i
 */
	bool
isleap ( long long int n )
{
	if (((n % 4 == 0) && (n % 100 != 0)) || (n % 400 == 0)) return true;
	return false;
}		/* -----  end of function isleap  ----- */

	int
main ( int argc, char *argv[] )
{
	long long a, b, result;// i;
//freopen("in.txt", "r", stdin);	
	while ( ~scanf("%lld%lld", &a, &b) ) {
		result = 0;
		while (!isleap(a)) ++a;
		while (!isleap(b)) --b;
		if (a > b) result = 0;
		else if (a == b) result = 1;
		else {
			result = (b - a) / 4 + 1;
			while ((a % 100) || (a % 400 == 0)) ++a;
			while ((b % 100) || (b % 400 == 0)) --b;
			if (a <= b) {
				result -= ((b - a) / 100 + 1);
				result += (b - a) / 400; 
			}
		}
		printf ( "%lld\n", result );
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

