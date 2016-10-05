// rectangle.cpp --- 矩形嵌套问题
//
// Filename: rectangle.cpp
// Description:
// Author: liu
// Maintainer:
// Created: Wed Oct  5 19:21:27 2016 (+0800)
// Version:
// Package-Requires: ()
// Last-Updated: Wed Oct  5 19:38:51 2016 (+0800)
//           By: liu
//     Update #: 14
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

const int N = 20000;
int d[N],n,G[N][N],len;

int dp(int i) {
  int &ans=d[i];
  if(-1!=ans)return ans;
  ans=1;
// 这里应该是1，而不是负无穷。因为即使一个矩形最大，那么以它为开始的最
// 长路的长度是1.
  for (auto j = 1; j < n+1; ++j) {
    if(G[i][j]){
      ans=max(ans,dp(j)+1);
    }
  }

  return ans;
}

// 输出字典序最小的路径。
void print_ans(int i){
  cout << i << " ";
  for (auto j = 1; j < n+1; ++j) {
    if(G[i][j] && d[i]==d[j]+1){
      print_ans(j);
      break;// 注意这里。
    }
  }
}

void print_all_ans(int i,vector<int>path){
  for (auto j = 1; j < n+1; ++j) {
    if(G[i][j] && d[i]==d[j]+1){
      std::vector<int> path1(path);
      path1.push_back(j);
      print_all_ans(j,path1);
    }
  }
  if((int)path.size()!=len)return;//注意这里，如果不是解，那么不输出。
  for (auto it = path.begin(); it != path.end(); ++it) {
    cout << *it << " ";
  }
  cout << "\n";
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("rectangle.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int m;
  cin>>n>>m;
  for (auto i = 0; i < m; ++i) {
    int u,v;
    cin>>u>>v;
    G[u][v]=1;
  }

  memset(d,-1,sizeof(d));
  int pos=INT_MAX;
  len=INT_MIN;
  for (auto i = 1; i < n+1; ++i) {
    if (len<dp(i)) {
      len=d[i];
      if(pos>i)pos=i;
    }
  }
  cout << "len="<<len << "\n";
  print_ans(pos);
  cout << "\n---------\n";
  for (auto i = 1; i < n+1; ++i) {
    if(len==d[i]){
      std::vector<int> path(1, int(i));
      print_all_ans(i,path);
    }
  }


  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


//
// rectangle.cpp ends here
