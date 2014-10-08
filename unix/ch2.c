#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>


	int
main ( int argc, char *argv[] )
{
	int x = 0;
	++x;
#ifdef DEBUG
	fprintf(stderr, "The current of x is %d\n", x);
#endif
	printf ( "x = %d\n", x );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
