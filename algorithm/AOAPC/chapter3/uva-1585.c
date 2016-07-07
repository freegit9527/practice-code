/*
  UVa 1585 - Score
  2016/07/07 10:54:50 AM
 */
#include <stdio.h>
#include <string.h>

char a[100];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1585.txt", "r", stdin);
  #endif
  int T;
  scanf("%d", &T);

  while (T--) {
    scanf("%s", a);
    int sum = 0, cnt = 0, len = strlen(a), i;

    for (i = 0; i < len; ++i) {
      if (a[i] == 'O') {
        sum += ++cnt;
      } else {
        cnt = 0;
      }
    }

    printf("%d\n", sum);
  }

  return 0;
}
