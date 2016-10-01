//
// Created by liu on 16/10/01. 21:11
//

#include <iostream>
#include <algorithm>
typedef long long ll;
using namespace std;

int main(void) {
  #ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif
  ll l1, r1, l2, r2, k;
  while(cin>>l1>>r1>>l2>>r2>>k) {
    ll left = max(l1, l2), right = min(r1, r2), ans = 0;
    if (left <= right) {
      ans = right - left + 1;
      if (k >= left && k <= right) {
        ans--;
      }
    }
    cout << ans << endl;
  }

    return 0;
}
