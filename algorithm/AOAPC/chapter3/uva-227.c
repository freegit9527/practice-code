/*
  UVa 227 - Puzzle
  2016/07/07 12:54:26 PM
 */

#include <stdio.h>
#include <string.h>

char a[10][10];
char message[] = "This puzzle has no final configuration.";
char move[] = "ABLR";

int main(void) {
  #ifdef DEBUG
  freopen("uva-227-1.txt", "r", stdin);
  #endif

  int n = 0;

  while (NULL != fgets(a[0], 10, stdin)) {
    if (a[0][0] == 'Z' && strlen(a[0]) < 5) break;
    a[0][5] = '\0';
    for (int i = 1; i <= 4; ++i) {
      fgets(a[i], 10, stdin);
      a[i][5] = '\0';
      if (a[i][4] == '\n') a[i][4] = ' ';
    }

    /* printf("--------\n"); */
    /* for (int i = 0; i < 5; ++i) { */
    /*   printf("|a[i] = <%s>\n", a[i]); */
    /* } */
    /* printf("--------\n"); */

    if (n) printf("\n");
    printf("Puzzle #%d:\n", ++n);

    int mark = 1, posx = -1, posy = -1;
    char ch;

    for (int i = 0; i < 5; ++i) {
      for (int j = 0; j < 5; ++j) {
        if (a[i][j] == ' ') {
          posx = i; posy = j; break;
        }
      }
      if (-1 != posx) break;
    }
    /* printf("posx = %d, posy = %d\n", posx, posy); */

    while ((ch = getchar()) != '0') {
      if (ch == '\n') continue;
      if (NULL == strchr(move, ch)) {
        mark = 0;
      }
      if (!mark) continue;
      switch(ch) {
      case 'A':
        if (posx - 1 >= 0) {
          a[posx][posy] = a[posx - 1][posy];
          a[--posx][posy] = ' ';
        } else mark = 0;
        break;
      case 'B':
        if (posx + 1 < 5) {
          a[posx][posy] = a[posx + 1][posy];
          a[++posx][posy] = ' ';
        } else mark = 0;
        break;
      case 'L':
        if (posy - 1 >= 0) {
          a[posx][posy] = a[posx][posy - 1];
          a[posx][--posy] = ' ';
        } else mark = 0;
        break;
      case 'R':
        if (posy + 1 < 5) {
          a[posx][posy] = a[posx][posy + 1];
          a[posx][++posy] = ' ';
        } else mark = 0;
      }
    }
    getchar();

    if (mark) {
      for (int i = 0; i < 5; ++i) {
        printf("%c", a[i][0]);
        for (int j = 1; j < 5; ++j) {
          printf(" %c", a[i][j]);
        }
        printf("\n");
      }
    } else printf("%s\n", message);
  }
  return 0;
}
