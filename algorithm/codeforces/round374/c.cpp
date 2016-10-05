// c.cpp --- 
// 
// Filename: c.cpp
// Description: 
// Author: liu
// Maintainer: 
// Created: Wed Oct  5 14:33:21 2016 (+0800)
// Version: 
// Package-Requires: ()
// Last-Updated: Wed Oct  5 17:19:13 2016 (+0800)
//           By: liu
//     Update #: 28
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
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n-1; i >= a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(),(x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int,int> MI;
typedef long long ll;
typedef pair<int,int> PII;
const ll MOD=1000000007;

const int N = 5000+10;
int n,m,T;
int edge[N][N], dp[N][N];
//int d[N];

int dpfunc(int i,int t)
{
        int &ans = dp[i][t];
        if(-1!=ans) return ans;
        ans=INT_MIN;
        for (auto j = 1; j < n+1; ++j) {
                if(edge[i][j]&&t>=edge[i][j]){
                        ans=max(ans,//dp[j][t-edge[i][j]]
                                     dpfunc(j,t-edge[i][j])+1);
                }
        }
        return ans;
}
void print_ans(int i,int t)
{
        for (auto j = 1; j < n+1; ++j) {
                if(edge[j][i]&&dp[j][edge[j][i]+t]+1==dp[i][t]){
                        print_ans(j,edge[j][i]+t);
                }
        }

        cout << i << " ";
}

int main ( void )
{
        _
#ifndef  ONLINE_JUDGE
                freopen("c_in.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

        while (cin>>n>>m>>T) {
                int ui,vi,ti;
                memset(edge,0,sizeof(edge));
                //memset(d,-1,sizeof(d));
                memset(dp,-1,sizeof(dp));
                for (auto i = 0; i < m; ++i) {
                        cin>>ui>>vi>>ti;
                        edge[ui][vi]=ti;
                }
                dpfunc(n,T);
                int ans=0,ans1=0;
                for (auto i = 0; i < T+1; ++i) {
                        if (dp[n][i]>ans) {
                                ans=dp[n][i];
                                ans1=i;
                        }
                        cout << dp[n][i] << "\n";
                }
                cout <<ans  << "\n";
//                cout <<"ans1="<<ans1  << "\n";
                //print_ans(ans,ans1);

        }

        return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

// 
// c.cpp ends here
