// coins.cpp --- 硬币问题。DAG上的动态规划。
//
// Filename: coins.cpp
// Description:
// Author: liu
// Maintainer:
// Created: Thu Oct  6 00:08:39 2016 (+0800)
// Version:
// Package-Requires: ()
// Last-Updated:
//           By:
//     Update #: 3
// URL:
// Doc URL:
// Keywords:
// Compatibility:
//
//

// Commentary:
//
//
//
//

// Change Log:
//
//
//
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
//
//

// Code:

#include <bits/stdc++.h>
using namespace std;
using ll = long long;
#define _                                                                      \
  ios_base::sync_with_stdio(0);                                                \
  cin.tie(0);
const ll MOD = 1000000007;

const int N = 2000;
int a[N], n, S, d_max[N], vis[N], min_d[N], max_d[N], min_path[N], max_path[N];

// 方法一
int dp_max(int s) {
  int &ans = d_max[s];
  if (vis[s])
    return ans;
  vis[s] = 1;
  // if(-1!=ans)return ans;
  ans = INT_MIN;
  for (auto i = 1; i < n + 1; ++i) {
    if (s >= a[i]) {
      ans = max(ans, dp_max(s - a[i]) + 1);
    }
  }

  return ans;
}

void print_ans(int *d, int s) {
  for (auto i = 1; i < n + 1; ++i) {
    if (d[s] == d[s - a[i]] + 1) {
      cout << i << " ";
      print_ans(d, s - a[i]);
      break;
    }
  }
}

void print_path(int *path, int s) {
  while (s) {
    cout << path[s] << " ";
    s = s - a[path[s]];
  }
  cout << "\n";
}

int main(void) {
  _
#ifndef ONLINE_JUDGE
      freopen("coins.txt", "r", stdin);
#endif /* -----  ONLINE_JUDGE  ----- */

  while (cin >> n >> S) {
    for (auto i = 1; i < n + 1; ++i) {
      cin >> a[i];
    }
    memset(d_max, -1, sizeof(d_max));
    memset(vis, 0, sizeof(vis));
    vis[0] = 1; // 如果要使用标记数组的话，一定要注意这个。
    d_max[0] = 0; // 注意边界条件。
    dp_max(S);
    cout << d_max[S] << "\n";
    // for_each(d_max,d_max+S+1,[](int x){cout << x<<" ";});
    // cout << "\n";

    // 方法二
    memset(max_d, -1, sizeof(max_d));
    for (auto i = 1; i < S + 1; ++i) {
      min_d[i] = INT_MAX;
    }

    min_d[0] = max_d[0] = 0;
    for (auto i = 1; i < S + 1; ++i) {
      for (auto j = 1; j < n + 1; ++j) {
        if (i >= a[j]) {
          if (max_d[i - a[j]] + 1 > max_d[i]) {
            max_d[i] = max_d[i - a[j]] + 1;
            max_path[i] = j;
          }
          max_d[i] = max(max_d[i], max_d[i - a[j]] + 1);
          // 注意保证不会出现INT_MAX+1的情况。
          if (min_d[i - a[j]] != INT_MAX && min_d[i - a[j]] + 1 < min_d[i]) {
            min_d[i] = min_d[i - a[j]] + 1;
            min_path[i] = j;
          }
        }
      }
    }
    cout << "min and max is:"
         << "\n";
    cout << min_d[S] << " " << max_d[S] << "\n";
    // 输出字典序最小的解：
    print_ans(min_d, S);
    cout << "\n";
    print_ans(max_d, S);
    cout << "\nAnother way to print path"
         << "\n";
    print_path(min_path, S);
    print_path(max_path, S);
  }

  return EXIT_SUCCESS;
} /* ----------  end of function main  ---------- */

//
// coins.cpp ends here
