/*
  UVa 232 - Crossword Answers
  2016/07/07 2:50:32 PM
 */

char a[15][15];
int b[15][15];

#include <stdio.h>
#include <string.h>

int main(void) {
  #ifdef DEBUG
  freopen("uva-232.txt", "r", stdin);
  #endif

  int n = 0, r, c;
  while (scanf("%d", &r) == 1 && r) {
    if (n) printf("\n");
    printf("puzzle #%d:\n", ++n);
    scanf("%d", &c);
    memset(b, 0, sizeof(b));

    for (int i = 0; i < r; ++i) {
      scanf("%s", a[i]);
    }

    int start_n = 0;

    for (int i = 0; i < r; ++i) {
      for (int j = 0; j < c; ++j) {
        if (a[i][j] != '*' && (i == 0
                               || j == 0
                               || a[i][j-1] == '*'
                               || a[i-1][j] == '*')) {
          b[i][j] = ++start_n;
        }
      }
    }

    printf("Across\n");
    for (int i = 0; i < r; ++ i) {
      for (int j = 0; j < c; ++j) {
        if (b[i][j]) {
          printf(" %2d.", b[i][j]);
          while (j < c && a[i][j] != '*') {
            printf("%c", a[i][j]); ++j;
          }
          printf("\n"); --j;
        }
      }
    }

    printf("Down\n");
    for (int i = 0; i < r; ++i) {
      for (int j = 0; j < c; ++j) {
        if (b[i][j]) {
          printf(" %2d.", b[i][j]);
          int backup = i;
          while (i < r && a[i][j] != '*') {
            printf("%c", a[i][j]);
            if (b[i][j]) b[i][j] = 0;
            ++i;
          }
          i = backup;
          printf("\n");
        }
      }
    }
  }
  return 0;
}
