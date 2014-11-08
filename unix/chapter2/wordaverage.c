#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#define WORD_DELIMITERS " "
#define LINE_DELIMITERS "\n"

int wordcount(char *s)
{
	char *lasts;
	int count = 1;
	if (NULL == strtok_r(s, WORD_DELIMITERS, &lasts))
		return 0;
	while (NULL != strtok_r(NULL, WORD_DELIMITERS, &lasts))
		++count;
	return count;
}

double wordaverage(char *s)
{
	char *lasts;
	int cnt;
	int line_cnt = 1;
	char *c = strtok_r(s, LINE_DELIMITERS, &lasts);
	if ( NULL == c ) return 0.0;
	cnt = wordcount(c);
	while ( NULL != (c = strtok_r(NULL, LINE_DELIMITERS, &lasts)) ) {
		cnt += wordcount(c);
		++line_cnt;
	}
	return (double)cnt / line_cnt;
}

	int
main ( int argc, char *argv[] )
{
//	char str[] = "l li liu xuey yangx";
	char str[] = "l li liu xuey yangx\nand this is another ";
	printf ( "%lf\n", wordaverage(str) );

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
