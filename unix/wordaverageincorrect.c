#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define WORD_DELIMITERS " "
#define LINE_DELIMITERS "\n"

int wordcount(char *s)
{
	int count = 1;
	if (NULL == strtok(s, WORD_DELIMITERS))
		return 0;
	while (NULL != strtok(NULL, WORD_DELIMITERS))
		++count;
	return count;
}

double wordaverage(char *s)
{
	int cnt;
	int line_cnt = 1;
	char *c = strtok(s, LINE_DELIMITERS);
	if ( NULL == c ) return 0.0;
	cnt = wordcount(c);
	while ( NULL != (c = strtok(NULL, LINE_DELIMITERS)) ) {
		cnt += wordcount(c);
		++line_cnt;
	}
	return (double)cnt / line_cnt;
}

	int
main ( int argc, char *argv[] )
{
	char str[] = "l li liu xuey yangx\nand this is another ";
	printf ( "%lf\n", wordaverage(str) );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
