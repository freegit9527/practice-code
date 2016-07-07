/*
  UVa 1225 Digit Counting
  2016/07/07 11:57:27 AM
 */
#include <stdio.h>
#include <string.h>

int cnt[10];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1225.txt", "r", stdin);
  #endif
  int T;
  scanf("%d", &T);
  while (T--) {
    int n; scanf("%d", &n);
    memset(cnt, 0, sizeof(cnt));
    int i;
    for (i = 1; i <= n; ++i) {
      int x = i;
      while (x) {
        ++cnt[x % 10]; x /= 10;
      }
    }
    for (i = 0; i < 9; ++i) {
      printf("%d ", cnt[i]);
    }
    printf("%d\n", cnt[9]);
  }
  return 0;
}
