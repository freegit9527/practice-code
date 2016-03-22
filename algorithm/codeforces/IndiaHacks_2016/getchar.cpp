/*
 * =====================================================================================
 *       Filename : getchar.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/21/16 07:44
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
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
template <typename T>
inline void R(T &x) {
  char ch = getchar();
  x = 0;
  for (; ch < '0' || ch > '9'; ch = getchar())
    ;
  for (; ch <= '9' && ch >= '0'; ch = getchar()) x = x * 10 + ch - '0';
}
  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
//freopen("", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  int n;
  R(n);
  printf ( "n = %d\n", n );

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

