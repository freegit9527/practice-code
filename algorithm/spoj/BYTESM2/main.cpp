/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/BYTESM2/
 *
 *        Version:  1.0
 *        Created:  08/12/2016 18:49:12
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), liuxueyang457@gmail.com
 *
 * =====================================================================================
 */
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
const int N=120;
int a[N][N],result;
  int
main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  int T;cin>>T;while(T--){
    memset(a,0,sizeof(a));
    int r,c;cin>>r>>c;rep(i,1,r+1)rep(j,1,c+1)cin>>a[i][j];
    rep(i,2,r+1)rep(j,1,c+1){
      int tmp=0;
      tmp=max(a[i-1][j],tmp);
      if(j>=2)tmp=max(tmp,a[i-1][j-1]);
      if(j<=c-1)tmp=max(tmp,a[i-1][j+1]);
      a[i][j]+=tmp;
    }
    result=0;rep(j,1,c+1)result=max(result,a[r][j]);
    cout<<result<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

