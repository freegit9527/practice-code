// http://codeforces.com/contest/723

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

int main()
{
  #ifndef ONLINE_JUDGE
  freopen("b_in.txt", "r", stdin);
  #endif
  char a[300];
  int nn;
  
  while (cin >> nn) {
    cin >> a;
    int n = strlen(a);
    int len_out = 0, len_in = 0, tmp_out = 0;
    bool in = false;
    for (int i = 0; i < n; ++i) {
      if (a[i] == '(') {
        in = true;
        len_out = max(len_out, tmp_out);
        tmp_out = 0;
      }
      if (a[i] == ')') {
        in = false;
      }
      if (a[i] == '_') {
        if (!in) {
          len_out = max(len_out, tmp_out);
          tmp_out = 0;
        }
      }
      if ((a[i] >= 'A' && a[i] <= 'Z') ||
          (a[i] >= 'a' && a[i] <= 'z')) {
        if (in) {
          len_in ++;
          while ((i < n) &&
                 ((a[i] >= 'A' && a[i] <= 'Z') ||
                  (a[i] >= 'a' && a[i] <= 'z'))) ++i;
          if (i < n) i--;
        }
        else tmp_out ++;
      }
    }
    len_out = max(len_out, tmp_out);
    cout << len_out << ' ' << len_in << endl;
  }
  return 0;
}
