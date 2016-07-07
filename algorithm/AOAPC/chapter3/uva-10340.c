/*
  UVa 10340
  2016/07/07 08:04:30 PM
  THERE IS A BUG... PLEASE REFER TO uva-10340.cpp
*/

#include <stdio.h>
#include <string.h>

char s[100000], t[100000];

int main(void) {
#ifdef DEBUG
  freopen("uva-10340.txt", "r", stdin);
#endif

  while (scanf("%s%s", s, t) != EOF) {
    int lens = strlen(s), lent = strlen(t);

    if (lens > lent) {
      printf("No\n"); continue;
    }
    if (lens == lent && strcmp(s, t) != 0) {
      printf("No\n"); continue;
    }

    int mark = 1;
    int j = 0;

    for (int i = 0; i < lens; ++i) {
      for (; j < lent; ++j) {
        if (s[i] == t[j]) {
          ++j;
          break;
        }
      }
      if (j == lent) {
        mark = 0;
        break;
      }
    }

    if (mark) printf("Yes\n");
    else printf("No\n");
  }

  return 0;
}
