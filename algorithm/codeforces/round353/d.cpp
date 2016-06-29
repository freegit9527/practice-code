/*
 * =====================================================================================
 *
 *       Filename:  d.cpp
 *        Created:  2016年06月08日 16时24分02秒
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>

using namespace std;

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
int n, a[100000+10];

/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:  
 * =====================================================================================
 */
  int
main ( int argc, char *argv[] )
{

#ifndef  ONLINE_JUDGE
freopen("d.in", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  
  while ( ~scanf("%d", &n) ) {

    for ( int i = 0; i < n; ++i) {
      scanf("%d", a + i);
    }
  }
  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

