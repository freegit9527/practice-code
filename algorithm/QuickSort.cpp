/*
 * =====================================================================================
 *       Filename : QuickSort.cpp
 *    Description : QuickSort
 *    Version     : 0.1
 *        Created : 10/04/14 14:54
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <bits/stdc++.h>

using namespace std;

/*  Name:  QuickSort
 *  Description:  quick sort function
 */
	void
QuickSort ( int low, int high, int a[] )
{
	if (low >= high) return;
	int i = low, j = high, tmp = a[low];
	while ( true ) {
		while ( a[j] >= tmp && j > i) --j;
		while ( a[i] <= tmp && i < j ) ++i;
		if (i == j) break;
		swap(a[i], a[j]);
	}
	swap(a[i], a[low]);
	QuickSort(low, i - 1, a);
	QuickSort(i + 1, high, a);
	return ;
}		/* -----  end of function QuickSort  ----- */
	int
main ( int argc, char *argv[] )
{
	// 1, 2, 3, 4, 5, 6, 7, 8
	const int N = 8;
	int a[8] = { 7, 6, 3, 2, 1, 4, 5, 8 };

	//print initial array
	cout << "original array:" << endl;
	for ( int i = 0; i < N; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

	QuickSort(0, N - 1, a);

	//output
	cout << "\n\nsorted array:" << endl;
	for ( int i = 0; i < N; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/*
 * Obviously, it is unstable. ;-)
 */
