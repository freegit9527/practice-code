/*
 * =====================================================================================
 *       Filename : InsertSort.cpp
 *    Description : InsertSort
 *    Version     : 0.1
 *        Created : 10/04/14 14:54
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <bits/stdc++.h>

using namespace std;

	int
main ( int argc, char *argv[] )
{
	// 1, 2, 3, 4, 5, 6, 7, 8
	const int N = 8;
	int a[8] = { 7, 6, 3, 2, 1, 4, 5, 8 };

	//print initial array
	cout << "original array:" << endl;
	for ( int i = 0; i < 8; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

	for ( int i = 1; i < N; ++i ) {
		for ( int j = i; j > 0; --j ) {
			if ( a[j] < a[j-1] ) {
				swap(a[j], a[j-1]);
			}
			else {
				break;
			}
		}
	}

	//output
	cout << "\n\nsorted array:" << endl;
	for ( int i = 0; i < 8; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


/*
 * Obviously, it is stable. ;-)
 * Because we never exchange two element with the same value.
 */
