#include <iostream>

using namespace std;

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif
  int base;
  while (cin >> base) {
    int h, m;
    scanf("%d:%d", &h, &m);
    if (!(m >= 0 && m <= 59)) {
      m = m % 10;
    }
    if (12 == base) {
      if (!(h >= 1 && h <= 12)) {
        if (h == 0) {
          h = 1;
        }
        else if (h / 10 == 1 || h % 10 == 0) {
          h = 10;
        }
        else {
          h = h % 10;
        }
      }
    }
    else {
      if (!(h >= 0 && h <= 23)) {
        if (h / 10 == 2) {
          h = 20;
        }
        else {
          h = h % 10;
        }
      }
    }
    printf("%02d:%02d\n", h, m);
  }
  
  return 0;
}
