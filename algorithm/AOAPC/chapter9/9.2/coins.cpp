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
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;

const int N=2000;
int a[N],n,S,d_max[N],vis[N];

int dp_max(int s){
  int & ans=d_max[s];
  if(vis[s])return ans;
  vis[s]=1;
  //if(-1!=ans)return ans;
  ans=INT_MIN;
  cout << "s=" << s << ", ans=" << ans  << "\n";
  for (auto i = 1; i < n+1; ++i) {
    if(s>=a[i]){
      ans=max(ans,dp_max(s-a[i])+1);
    }
  }

  return ans;
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("coins.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  while (cin>>n>>S) {
    for (auto i = 1; i < n+1; ++i) {
      cin>>a[i];
    }
    memset(d_max,-1,sizeof(d_max));
    memset(vis,0,sizeof(vis));
    vis[0]=1;// 如果要使用标记数组的话，一定要注意这个。
    d_max[0]=0; // 注意边界条件。
    dp_max(S);
    cout << d_max[S] << "\n";
    for_each(d_max,d_max+S+1,[](int x){cout << x<<" ";});
    cout << "\n";
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

//
// coins.cpp ends here
