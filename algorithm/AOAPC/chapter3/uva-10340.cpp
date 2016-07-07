/*
  UVa 10340
  2016/07/07 08:04:30 PM
*/

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <string>

using namespace std;

// char s[100000], t[100000];
string s, t;

int main(void) {
#ifdef DEBUG
  freopen("uva-10340.txt", "r", stdin);
#endif

  while (cin >> s >> t) {
    int lens = s.length(), lent = t.length();

    if (lens > lent) {
      printf("No\n");
      continue;
    }
    if (lens == lent && s != t) {
      printf("No\n");
      continue;
    }

    int mark = 1, is_find = 0;
    int j = 0;

    for (int i = 0; i < lens; ++i) {
      is_find = 0;
      for (; j < lent; ++j) {
        if (s[i] == t[j]) {
          ++j;
          is_find = 1;
          break;
        }
      }
      if (!is_find) {
        mark = 0;
        break;
      }
    }

    printf("%s\n", mark ? "Yes" : "No");
  }

  return 0;
}
