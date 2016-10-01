#include <iostream>
#include <cstdio>
#include <cstdlib>

using namespace std;

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif

  int n, p[200], cnt;
  //  char a[200];
  while (cin >> n) {
    for (int i = 0; i < n; ++i) {
      cin >> p[i];
    }
    getchar();
    bool mark = true;
    for (int i = 0; i < n; ++i) {
      cnt = 0;
      char ch;
      while ('\n' != (ch = getchar())) {
        if (ch == 'a' ||
            ch == 'e' ||
            ch == 'i' ||
            ch == 'o' ||
            ch == 'u' ||
            ch == 'y') {
          cnt++;
        }
      }
      if (cnt != p[i]) {
        mark = false;
      }
    }
    cout << (mark ? "YES" : "NO") << endl;
  }
  
  return 0;
}
