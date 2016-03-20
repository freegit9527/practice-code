/*
 * =====================================================================================
 *       Filename : 3_2.cpp
 *    Description :
 *    Version     :
 *        Created : 03/20/16 21:38
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  :
 * =====================================================================================
 */
#include <bits/stdc++.h>
using namespace std;
int n, a[200005];
int main() {
  cin >> n;
  a[0] = 1e9;
  vector<int> v;
  if (n & 1)
    a[n + 1] = 1e9;
  else
    a[n + 1] = -1;
  for (int i = 1; i <= n; ++i) {
    scanf("%d", a + i);
  }
  for (int i = 1; i <= n; ++i) {
    if (i & 1) {
      if (a[i] >= a[i - 1] || a[i] >= a[i + 1]) v.push_back(i);
    } else if (a[i] <= a[i - 1] || a[i] <= a[i + 1])
      v.push_back(i);
  }
  if (v.size() > 6) {
    cout << 0;
    return 0;
  }
  set<int> s;
  for (int i = 0; i < v.size(); ++i) s.insert(v[i]);
  long long ans = 0, ans1 = 0;
  for (int i = 0; i < v.size(); ++i) {
    int ind = v[i];
    for (int j = 1; j <= n; ++j) {
      swap(a[ind], a[j]);
      bool ok = 1;
      v.push_back(j);
      for (int k = 0; k < v.size(); ++k) {
        if (v[k] & 1) {
          if (a[v[k]] >= a[v[k] - 1] || a[v[k]] >= a[v[k] + 1]) ok = 0;
        } else if (a[v[k]] <= a[v[k] - 1] || a[v[k]] <= a[v[k] + 1])
          ok = 0;
      }
      v.pop_back();
      if (s.count(j))
        ans1 += ok;
      else
        ans += ok;
      // cout<<v[i]<<" "<<j<<" "<<ok<<endl;
      swap(a[ind], a[j]);
    }
  }
  cout << ans + ans1 / 2 << endl;
}
