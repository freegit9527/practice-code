/*
 * =====================================================================================
 *       Filename : less_example.cpp
 *    Description : less example
 *    Version     : 
 *        Created : 03/20/15 11:15
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <iostream>
#include <functional>
#include <algorithm>

using namespace std;

	int
main ( int argc, char *argv[] )
{
	int foo[] = {10, 20, 5, 15, 25};
	int bar[] = {15, 10, 20};
	sort(foo, foo + 5, less<int>());
	sort(bar, bar + 3, less<int>());
	if ( includes(foo, foo + 4, bar, bar + 3, less<int>()) ) {
		cout << "foo includes bar.\n" ;
	}

	//greater example
	
	int numbers[] = {20, 40, 50, 10, 30};
	sort(numbers, numbers + 5, greater<int>());

	for ( int i = 0; i < 5; ++i ) {
		cout << numbers[i] << " " ;
	}
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

