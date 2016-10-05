// 9.1.2.cpp --- learn DP
//
// Filename: 9.1.2.cpp
// Description:
// Author: liu
// Maintainer:
// Created: Wed Oct  5 18:22:35 2016 (+0800)
// Version:
// Package-Requires: ()
// Last-Updated: Wed Oct  5 19:15:52 2016 (+0800)
//           By: liu
//     Update #: 23
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
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;

const int N=2000;
int n;
int a[N][N], dp[N][N];

// 方法一
int solve(int i,int j) {
  int & ans = dp[i][j];
  if(-1!=ans) return ans;
  return ans=(i==n ? 0 : max(solve(i+1,j), solve(i+1, j+1))) + a[i][j];
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  cin>>n;
  memset(a,-1,sizeof(a));
  memset(dp,-1,sizeof(dp));

  //方法二
  for (auto i = n; i >= 1; --i) {
    dp[n][i]=a[n][i];
  }
  for (auto i = n - 1; i >= 1; --i) {
    for (auto j = 1; j < i+1; ++j) {
      dp[i][j]=max(dp[i+1][j],dp[i+1][j+1])+a[i][j];
    }
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


//
// 9.1.2.cpp ends here
