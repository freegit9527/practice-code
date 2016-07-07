/*
  UVa 1584
  2016/07/07
 */
#include <stdio.h>
#include <string.h>

#define MIN_N 110

char a[MIN_N], tmp_str[MIN_N], min_str[MIN_N];

int main(void) {
  #ifdef DEBUG
  freopen("uva-1584.txt", "r", stdin);
  #endif

  int T;
  scanf("%d", &T);
  while(T--) {
    scanf("%s", a);
    int len = strlen(a);
    strcpy(min_str, a);
    int i;

    for (i = 1; i < len; ++i) {
      strcpy(tmp_str, a + i);
      strncat(tmp_str, a, i);
      if (strcmp(tmp_str, min_str) < 0) {
        strcpy(min_str, tmp_str);
      }
    }
    puts(min_str);
  }

  return 0;
}
