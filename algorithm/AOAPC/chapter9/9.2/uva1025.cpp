// uva1025.cpp ---
//
// Filename: uva1025.cpp
// Description:
// Author: liu
// Maintainer:
// Created: Thu Oct  6 17:53:20 2016 (+0800)
// Version:
// Package-Requires: ()
// Last-Updated: Fri Oct  7 08:54:54 2016 (+0800)
//           By: liu
//     Update #: 74
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
// 7-Oct-2016    liu
//    Last-Updated: Fri Oct  7 08:52:01 2016 (+0800) #70 (liu)
//    test my original version: after change the t array size,
//    got AC. I SHOULD HAVE USE CONST INT TO SET ARRAY SIZE!!!
//    Last-Updated: Fri Oct  7 08:39:33 2016 (+0800) #97 (liu)
//    change hard-coded limit to const int variable. Find the
//    BUG. I set the t array to: int t[22]. size is WRONG.
// 7-Oct-2016    liu
//    Last-Updated: Fri Oct  7 08:36:51 2016 (+0800) #92 (liu)
//    change nested for loop dp. change EXIT_SUCCESS to 0.
// 7-Oct-2016    liu
//    Last-Updated: Thu Oct  6 23:21:44 2016 (+0800) #67 (liu)
//    change train to hasTrain. change INT_MAX to inf.
//
//
//
//
//

// Code:

#include <bits/stdc++.h>
using namespace std;
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;
const int maxN = 55, maxT = 250;
int N, T, t[maxN], M1, d[maxN], M2, e[maxN], dp[maxT][maxN], train[maxT][maxN];

int main ( void )
{
  //  _
#ifndef  ONLINE_JUDGE
  freopen("uDebug.txt", "r", stdin);
  freopen("out.txt", "w", stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int caseN = 1;
  while (cin >> N) {
    if (!N) {
      break;
    }
    cout << "Case Number "
         << caseN << ": ";
    caseN++;

    cin >> T;
    for (auto i = 1; i < N; ++i) {
      cin >> t[i];
    }
    cin >> M1;
    for (auto i = 1; i < M1 + 1; ++i) {
      cin >> d[i];
    }
    cin >> M2;
    for (auto i = 1; i < M2 + 1; ++i) {
      cin >> e[i];
    }

    for (auto i = 0; i < T + 1; ++i) {
      for (auto j = 1; j < N + 1; ++j) {
        dp[i][j] = INT_MAX;
      }
    }
    dp[T][N] = 0;

    memset(train, 0, sizeof(train));
    int sum = 0;
    for (auto i = 1; i < N; ++i) {
      for (auto j = 1; j < M1 + 1; ++j) {
        if (sum + d[j] <= T) {
          // right
          train[sum+d[j]][i] |= 0b10;
        }
      }
      sum += t[i];
    }

    sum = 0;
    for (auto i = N; i > 1; --i) {
      for (auto j = 1; j < M2 + 1; ++j) {
        if (sum + e[j] <= T) {
          // left
          train[sum+e[j]][i] |= 0b01;
        }
      }
      sum += t[i-1];
    }

    for (auto k = T - 1; k >= 0; --k) {
      for (auto i = 1; i < N + 1; ++i) {
        // wait
        if (dp[k+1][i] != INT_MAX) {
          dp[k][i] = min(dp[k][i], dp[k+1][i] + 1);
        }
        // left
        if (i > 1 && k + t[i-1] <= T
            && (train[k][i] & 0b1)) {
          dp[k][i] = min(dp[k][i], dp[k+t[i-1]][i-1]);
        }
        // right
        if (i < N && k + t[i] <= T
            && (train[k][i] & 0b10)) {
          dp[k][i] = min(dp[k][i], dp[k+t[i]][i+1]);
        }
      }
    }
    if (dp[0][1] > T) {
      cout << "impossible" << "\n";
    }
    else {
      cout << dp[0][1] << endl;
    }
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */


//
// uva1025.cpp ends here
