#include <stdio.h>
#include <stdlib.h>

static int count = 0;
static int onepass(int a[], int n)
{
	int interchanges = 0;
	int i, tmp;
	for (i = 0; i < n - 1; ++i) {
		if (a[i] > a[i+1]) {
			tmp = a[i];
			a[i] = a[i+1];
			a[i+1] = tmp;
			interchanges = 1;
			++count;
		}
	}
	return interchanges;
}
void bubblesort(int a[], int n)
{
	int i;
	for (i = 0; i < n - 1; ++i) {
		if (!onepass(a, n - i)) {
			break;
		}
	}
}

	int
main ( int argc, char *argv[] )
{
	int a[] = {5, 4, 2, 1, 3};
	int i;

	bubblesort(a, 5);
	for (i = 0; i < 5; ++i) {
		printf ( "%d ", a[i] );
	}
	printf ( "\n" );
		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
