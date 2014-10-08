/*
 * =====================================================================================
 *       Filename : HeapSort.cpp
 *    Description : HeapSort
 *    Version     : 0.1
 *        Created : 10/04/14 14:54
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <bits/stdc++.h>

using namespace std;
int N = 8;

/*  Name:  sink
 *  Description:  sink one value down the heap
 */
	void
sink ( int i, int a[] )
{
	while ( i * 2 <= N ) {
		int goal = 2 * i;
		if ( 2 * i + 1 <= N && a[2*i+1] > a[2*i] ) { /* I have written a[2*i+1] > a[i] !!! fuck*/
			goal = 2 * i + 1;
		}
		if ( a[i] < a[goal] ) {
			swap(a[i], a[goal]);
		}
		else break;
		i = goal;
	}
	return ;
}		/* -----  end of function sink  ----- */

/*  NAME:  HEAPSORT
 *  DESCRIPTION:  HEAP SORT FUNCTION
 */
	void
HeapSort ( int a[] )
{
	for ( int i = N >> 1; i >= 1; --i ) {
		sink(i, a);
	}
	for ( int i = 1; i < 8; ++i ) {
		swap(a[1], a[N]);
		--N;
		sink(1, a);
	}
	return ;
}		/* -----  end of function HeapSort  ----- */
	int
main ( int argc, char *argv[] )
{
	// 1, 2, 3, 4, 5, 6, 7, 8
	int a[9] = { 0, 7, 6, 3, 2, 1, 4, 5, 8 };

	//print initial array
	cout << "original array:" << endl;
	for ( int i = 1; i <= N; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

	HeapSort(a);

	//output
	cout << "\n\nsorted array:" << endl;
	for ( int i = 1; i <= 8; ++i ) {
		cout << a[i] << " "; 
	}
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

/*
 * Obviously, it is unstable. ;-)
 */
