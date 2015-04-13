/*
 * =====================================================================================
 *       Filename : Test_Set.cpp
 *    Description : assignment operator with sets
 *    Version     : 
 *        Created : 03/20/15 08:35
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <set>
#include <cstdlib>

using namespace std;


	int
main ( int argc, char *argv[] )
{
	int myints[] = {12, 82, 37, 64, 15};
	set<int> first(myints, myints + 5);
	set<int> second;

	second = first;
	first = set<int>();

	cout << "Size of first: "  << int(first.size()) << "\n" ;
	cout << "Size of second: "  << int(second.size()) << "\n" ;

	set<int> myset;
	set<int>::iterator it;
	pair<set<int>::iterator, bool> ret;

	for ( int i = 1; i <= 5; ++i ) {
		myset.insert(i * 10);
	}
	ret = myset.insert(20);
	if ( false == ret.second ) {
		it = ret.first;
	}

	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << " "  << *it;
	}
	cout << endl;

	myset.insert(it, 25);
	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << " "  << *it;
	}
	cout << endl;

	myset.insert(it, 24);
	myset.insert(it, 26);

	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << " "  << *it;
	}
	cout << endl;

	myset.insert(myints, myints + 5);
	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << " "  << *it;
	}
	cout << endl;

	set<int>::iterator itlow, itup;
	for ( int i = 1; i < 10; ++i ) {
		myset.insert(i * 10);
	}
	itlow = myset.lower_bound(30);
	itup = myset.upper_bound(60);
	myset.erase(itlow, itup);
	cout << "myset contains: " ;
	for ( it = myset.begin(); it != myset.end(); ++it ) {
		cout << " "  << *it;
	}
	cout << endl;

	myset = set<int>();
	set<int>::key_compare mycomp = myset.key_comp();
	for ( int i = 0; i <= 5; ++i ) {
		myset.insert(i);
	}
	cout << "Myset contains: " ;
	set<int>::iterator highest = myset.find(3);
	set<int>::iterator iit = myset.begin();
	do {
		cout << " " << *iit;
	} while ( mycomp(*(++iit), *highest) );				/* -----  end do-while  ----- */

	cout << endl;
	

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

