#include <bits/stdc++.h>
using namespace std;
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;

int n, a[200000+10];

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("b_input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  while (cin >> n) {
    for (auto i = 0; i < n; ++i) {
      cin >> a[i];
      if (a[i] & 1) {
        a[i] = 1;
      }
      else if (0 == a[i]) {
        a[i] = 0;
      }
      else {
        a[i] = 2;
      }
    }
    bool mark = true;
    int coupon = 0;
    for (auto i = 0; i < n; ++i) {
      if (a[i] == 2) {
        if (0 != coupon) {
          coupon = 1;
        }
      }
      else if (1 == a[i]) {
        if (1 != coupon) {
          if (i != n-1) {
            coupon = 1;
          }
          else {
            mark = false;
            break;
          }
        }
        else {
          coupon = 0;
        }
      }
      else {
        if (coupon) {
          mark = false;
          break;
        }
      }
    }
    if (coupon == 1) {
      mark = false;
    }
    cout << (mark ? "YES" : "NO") << endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
