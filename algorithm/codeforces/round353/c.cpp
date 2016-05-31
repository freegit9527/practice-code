/*
 * =====================================================================================
 *       Filename : c.cpp
 *    Description : 
 *    Version     : 
 *        Created : 05/31/16 13:22
 *         Author : Liu Xue Yang (Lpaste), liuxueyang457@163.com
 *         Motto  : 
 * =====================================================================================
 */

#include <cstdio>
#include <cstring>
#include <algorithm>
#include <vector>
#include <string>
#include <map>
#include <set>
#include <cassert>
using namespace std;
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n-1; i > a; --i)
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
//const ll mod=1000000007;
int n, a[100000+10], segNumMax;
map<ll,int> preSum;
  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("c.in", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  while (~scanf("%d", &n)) {
    preSum.clear();
    segNumMax = 0;
    
    ll sum = 0;

    rep(i, 0, n) {
      scanf("%d", a + i);
      sum += a[i];
      preSum[sum]++;
      segNumMax = max(preSum[sum], segNumMax);
    }

    printf ( "%d\n", n - segNumMax );
  }

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

