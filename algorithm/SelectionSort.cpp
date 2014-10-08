/*
 * =====================================================================================
 *       Filename : SelectionSort.cpp
 *    Description : SelectionSort
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
	cout << "original array:" << endl;
	for ( int i = 0; i < 8; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

	int min_index;
	for ( int i = 0; i < N; ++i ) {
		min_index = i;
		for ( int j = i + 1; j < N; ++j ) {
			if ( a[j] < a[min_index] ) {
				min_index = j;
			}
		}
		swap(a[i], a[min_index]);
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
 * Is it stable? No.
 * for example: 
 * 5 4 4 3 2 1
 *
 * first loop, we get:
 * 1 4 4 3 2 5
 *
 * second loop, we get:
 * 1 2 4 3 4 5
 *
 * In the second loop, the first 4 is placed after the second 4
 * so select sort is not stable!
 *
 * Got it!
 */
