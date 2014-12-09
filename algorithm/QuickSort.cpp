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
//#include <bits/stdc++.h>
#include <cstdio>
#include <cstdlib>
#include <iostream>

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
	freopen("QuickSort.txt", "r", stdin);
	// 1, 2, 3, 4, 5, 6, 7, 8
//	const int N = 8;
	int num;
//	int a[8] = { 7, 6, 3, 2, 1, 4, 5, 8 };
	int *a;

//		cout << "Input array size: "; 
//		cin >> num;
		while (cin >> num) {
			a = (int*)malloc(num * sizeof(int));

			// input array element

			for ( int i = 0; i < num; ++i ) {
				cin >> a[i];
			}
			//print initial array
		//	cout << "original array:" << endl;
		//	for ( int i = 0; i < N; ++i ) {
		//	for ( int i = 0; i < num; ++i ) {
		//		cout << a[i] << " "; 
		//	}
		//	cout << endl;

			QuickSort(0, num - 1, a);
		//	QuickSort(0, N - 1, a);

			//output
			cout << "sorted array:" << endl;
		//	for ( int i = 0; i < N; ++i ) {
			for ( int i = 0; i < num; ++i ) {
				cout << a[i] << " "; 
			}
			cout << endl;
//			cout << "Input array size: "; 
		}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/*
 * Obviously, it is unstable. ;-)
 */
