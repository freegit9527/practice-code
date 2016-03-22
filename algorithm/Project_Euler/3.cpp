/*
 * =====================================================================================
 *       Filename : 3.cpp
 *    Description : 
 *    Version     : 
 *        Created : 03/22/16 19:42
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
const ll N = ll(600851475143/2) + 1;
ll n = 600851475143;
int prime[N];

  int
main ( int argc, char *argv[] )
{
#ifndef  ONLINE_JUDGE
freopen("3", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  for (ll i = 1; i < N; ++i) prime[i] = 0;
  printf ( "prime\n" );

    return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

