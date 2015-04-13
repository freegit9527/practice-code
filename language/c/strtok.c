/*
 * strtok example
 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

	int
main ( int argc, char *argv[] )
{
	char str[] = "- This, = a sample string.";
	char *pch;
	printf ( "Splitting string \"%s\" into tokens:\n", str );
	pch = strtok(str, ".,- ");
	while (NULL != pch) {
		printf ( "%s\n", pch );
		pch = strtok(NULL, ",-. ");
	}

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
