// c.cpp ---
//
// Filename: c.cpp
// Description:
// Author: liu
// Maintainer:
// Created: Wed Oct  5 14:33:21 2016 (+0800)
// Version:
// Package-Requires: ()
// Last-Updated: Thu Oct  6 17:03:04 2016 (+0800)
//           By: liu
//     Update #: 84
// URL:
// Doc URL:
// Keywords:
// Compatibility:
//
//

// Commentary:
// N个点，有权值的有向无环图。时间T，从点1到N，要求访问的点最多。
// 打印出访问的点的数目，并且打印出路径。
//
//

// Change Log:
//
//
//
//

// Code:

#include <bits/stdc++.h>
using namespace std;
#define _                                                                      \
  ios_base::sync_with_stdio(0);                                                \
  cin.tie(0);
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n - 1; i >= a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(), (x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int, int> MI;
typedef long long ll;
typedef pair<int, int> PII;
const ll MOD = 1000000007;

const int N = 5000 + 10;
int n, m, T;
int edge[N][N], dp[N][N];
bool vis[N][N];
// int d[N];

int dpfunc(int i, int t) {
        if (i==999) {
                cout<<"i=999,"<<
                        "t="<<t<<"dp[i][t]="<<
                        dp[i][t] <<endl;
        }
  if (vis[i][t]) {
    return dp[i][t];
  }
  vis[i][t] = true;
  int &ans = dp[i][t];
  ans = INT_MIN;
  for (auto j = 1; j < n + 1; ++j) {
                      if(i==999&&j==636){
                    cout<<
                            //"tmp=" <<tmp <<
                            " t = " << t
                        << " edge[999][636] = " << edge[999][636]
                        <<endl;
            }

    if (edge[i][j] && t >= edge[i][j]) {

            int tmp = dpfunc(j, t - edge[i][j]);
            if (tmp != INT_MIN && tmp + 1 > ans) {
                    ans = tmp + 1;
            }
    }
  }
  return ans;
}

void print_ans(int i, int t) {
        int tmp = dp[i][t];
        cout << i << " ";
  for (auto j = 1; j < n + 1; ++j) {
    if (edge[i][j] && dp[j][t-edge[i][j]] > 0 &&
        dp[j][t-edge[i][j]] + 1 == tmp) {
            print_ans(j, t - edge[i][j]);
            break;
    }
  }
}

int main(void) {
  _
#ifndef ONLINE_JUDGE
      freopen("c_in.txt", "r", stdin);
#endif /* -----  ONLINE_JUDGE  ----- */

  while (cin >> n >> m >> T) {
    int ui, vi, ti;
    memset(edge, 0, sizeof(edge));
    for (auto i = 1; i < n + 1; ++i) {
            for (auto j = 0; j < T + 1; ++j) {
                    dp[i][j] = INT_MIN;
                    vis[i][j] = false;
            }
    }
    for (auto i = 0; i < T + 1; ++i) {
            dp[n][i] = 1;
            vis[n][i]= true;
    }

    for (auto i = 0; i < m; ++i) {
      cin >> ui >> vi >> ti;
      edge[ui][vi] = ti;
    }
    dpfunc(1, T);
    int ans = 0, time = T;
    for (auto i = 0; i < T + 1; ++i) {
            if (dp[1][i] > ans) {
                    ans = dp[1][i];
                    time = i;
            }
    }

    //ans = dp[1][T];
    if(n==1000&&m==999&&T==10000)
            cout<<edge[999][636]
                << "time= "
                << time;
    // if(n==1000&&m==999&&T==10000){
    //         for (auto i = 0; i < T + 1; ++i) {
    //                 if(dp[999][i]>0){
    //                         cout << "dp[999]["<<i<<"]= "<<
    //                                 dp[999][i] << " ";
    //                 }
    //         }

    // }
    cout << "\n";
    cout << ans << "\n";
    print_ans(1, time);
    cout << "\n";
  }

  return EXIT_SUCCESS;
} /* ----------  end of function main  ---------- */

//
// c.cpp ends here
