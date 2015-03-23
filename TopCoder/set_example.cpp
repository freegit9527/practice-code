/*
 * =====================================================================================
 *       Filename : set_example.cpp
 *    Description : set example: lower_bound and upper_bound
 *    Version     : 
 *        Created : 03/23/15 09:43
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <set>
#include <cstdlib>
#include <cstdio>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	set<int> myset;
	set<int>::iterator itlow, itup, it;


	for ( int i = 1; i < 10; i += 2 ) {
		myset.insert(i);
	}

	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << *it << " " ;
	}
	cout << endl;

	itlow = myset.lower_bound(4);
	itup = myset.upper_bound(8);

	cout << "itlow: "  << (*itlow) << endl;
	cout << "itup: "  << (*itup) << endl;

	itup = myset.upper_bound(9);
	cout << "itup of 9: "  << (*itup) << endl;    /* note that output: 5!! */

	multiset<int> mul_set;
	mul_set.clear();

	mul_set.insert(101);

	cout << *(mul_set.rbegin()) << endl;          /* will be: 'command terminated'
	if mul_set if empty! */
//	cout << *mul_set.rbegin() * (*mul_set.rbegin()) << endl;


		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

