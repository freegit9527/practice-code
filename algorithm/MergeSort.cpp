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
const int N = 8;

/*  Name:  MergeSort
 *  Description:  MergeSort function
 */
	void
MergeSort ( int low, int high, int a[] )
{
	if ( low >= high ) return;
	int mid = low + ((high - low) >> 1);
	MergeSort(low, mid, a);
	MergeSort(mid + 1, high, a);

	// Merge 
	int a_new[N], i, j, k;
	for ( i = low; i <= high; ++i ) {
		a_new[i] = a[i];
	}
	i = low; 
	j = mid + 1;
	for ( k = low; k <= high; ++k ) {
		if ( i > mid ) {
			a[k] = a_new[j++];
		}
		else if ( j > high ) {
			a[k] = a_new[i++];
		}
		else if (a_new[j] < a_new[i]) {
			a[k] = a_new[j++];
		}
		else {
			a[k] = a_new[i++];
		}
	}
	return ;
}		/* -----  end of function MergeSort  ----- */
	int
main ( int argc, char *argv[] )
{
	// 1, 2, 3, 4, 5, 6, 7, 8
	int a[N] = { 7, 6, 3, 2, 1, 4, 5, 8 };

	//print initial array
	cout << "original array:" << endl;
	for ( int i = 0; i < N; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

	MergeSort(0, N - 1, a);

	//output
	cout << "\n\nsorted array:" << endl;
	for ( int i = 0; i < N; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/*
 * Obviously, it is stable. ;-)
 */
