#include <bits/stdc++.h>
using namespace std;
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("a_input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  char str[200];

  while (cin >> str) {
    char a = 'a', b;
    int cnt = 0;
    for (auto i = 0; i < (int)strlen(str); ++i) {
      b = str[i];
      if (a == b) {
        continue;
      }
      if (a > b) {
        swap(a, b);
      }
      int tmp = b - a;
      // cout << "tmp = " << tmp << "\n";
      cnt += min(tmp, 26 - tmp);
      a = str[i];
    }
    cout << cnt << "\n";
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
