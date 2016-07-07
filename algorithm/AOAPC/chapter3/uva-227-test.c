
#include <stdio.h>
#include <string.h>

char a[10][10];
char message[] = "This puzzle has no final configuration.";
char move[] = "ABLR";

int main(void) {
#ifdef DEBUG
  freopen("uva-227.txt", "r", stdin);
#endif

  int n = 0;
  /* char tmp_c; */

  while (NULL != fgets(a[0], 10, stdin)) {
    /* memset(a, 0, sizeof(a)); */
    if (a[0][0] == 'Z' && strlen(a[0]) < 5) break;

    a[0][5] = '\0';

    for (int i = 1; i <= 4; ++i) {
      fgets(a[i], 10, stdin);
      a[i][5] = '\0';
      if (a[i][4] == '\n') a[i][4] = ' ';
    }

    printf("n = %d", ++n);
    printf("--------\n");
    for (int i = 0; i < 5; ++i) {
      printf("|a[i] = <%s>\n", a[i]);
    }
    printf("--------\n");

    char ch;
    while ((ch = getchar()) != '0') ;
    getchar();


  }
}
