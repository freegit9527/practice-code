/*
 * =====================================================================================
 *       Filename : includes_example.cpp
 *    Description : includes algorithm example
 *    Version     : 
 *        Created : 03/20/15 09:12
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <algorithm>

using namespace std;

/*  Name:  myfunction
 *  Description:  compare two int
 */
	bool
myfunction ( int i, int j )
{
	return i < j;
}		/* -----  end of function myfunction  ----- */

	int
main ( int argc, char *argv[] )
{
	int container[] = {5, 10, 15, 2,
	25, 30, 35, 40, 45, 50};
	int continent[] = {40, 30, 20, 10};

	sort(container, container + 10);
	sort(continent, continent + 4);

	if ( includes(container, container + 10, continent, continent + 4) ) {
		cout << "container includes continent!\n"; 
	}
	else {
		cout << "container does not include continent!\n" ;
	}

	if ( includes(container, container + 10, continent, continent + 4, myfunction) ) {
		cout << "container includes continent!\n";
	}
	else {
		cout << "container does not include continent!\n" ;
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/* 

template <class InputIterator1, class InputIterator2>
bool includes (InputIterator1 first1, InputIterator1 last1,
		InputIterator2 first2, InputIterator2 last2)
{
	while (first2 != last2) {

		if ( (first1 == last1 || (*first2 < *first1 ) {
			return false;
		}
		if ( *first1 == *first2 ) {
			++first2;
		}
		++first1;

	}
	return true;
}

 */
