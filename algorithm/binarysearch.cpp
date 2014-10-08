/*
 * =====================================================================================
 *       Filename : binarysearch.cpp
 *    Description : binary search
 *    Version     : 0.1
 *        Created : 10/07/14 22:03
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <vector>
using namespace std;

int binarysearch1(int a[], int tmp, int low, int high)
{
	if (low > high) return low;
	int mid = low + (high - low) / 2;
	if (a[mid] > tmp)
		return binarysearch1(a, tmp, low, mid - 1);
	else if (a[mid] < tmp)
		return binarysearch1(a, tmp, mid + 1, high);
	else return low;
}

int binarysearch(int a[], int tmp, int low, int high)
{
	int mid = low + (high - low) / 2;
	while (low <= high) {
		if (a[mid] > tmp)
			high = mid - 1;
		else if (a[mid] < tmp)
			low = mid + 1;
		else {
			return mid;
		}
		mid = low + (high - low) / 2;
	}
	return low;
}

	int
main ( int argc, char *argv[] )
{
	int a[5] = {2, 4, 7, 8, 9};
	int len = sizeof(a) / 4;
	printf("%d\n", binarysearch1(a, 8, 0, len - 1));

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

