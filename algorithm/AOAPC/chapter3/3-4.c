#include <stdio.h>
#include <string.h>

char a[20];
char buf[100];

int main(void) {
  while (scanf("%s", a) != EOF) {
    int cnt = 0;
    for (int i = 100; i <= 999; ++i) {
      for (int j = 10; j <= 99; ++j) {
        int x = i * (j / 10), y = i * (j % 10), z = i * j;
        sprintf(buf, "%d%d%d%d%d", i, j, x, y, z);
        int mark = 1;
        for (int index = 0; index < strlen(buf); ++index) {
          if (strchr(a, buf[index]) == NULL) {
            mark = 0;
          }
        }
        if (mark) {
          printf("<%d>\n%5d\nX%4d\n-----\n%5d\n%d\n-----\n%d\n\n", ++cnt, i, j,
                 y, x, z);
        }
      }
    }
    printf("The number of solutions = %d\n", cnt);
  }

  return 0;
}
