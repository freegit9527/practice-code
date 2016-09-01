/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  2016/08/22 13时08分10秒
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), read3valprintloop@gmail.com
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
const int N=3000+10;
vector<VI> a(N);
int b[N][N];

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int n,m;
  while(cin>>n>>m){
    memset(b,0,sizeof(b));
    while(m--){
      int ai,bi;
      cin>>ai>>bi;
      b[ai][bi]=1;
      a[ai].push_back(bi);
    }
    ll ans=0;
    rep(i,1,n+1){
      rep(j,1,n+1){
        if(i!=j){
          int tot=0;
          rep(k,0,SZ(a[i])){
            int d=a[i][k];
            if(d!=j&&b[d][j]){
              tot++;
            }
          }
          ans+=tot*(tot-1)/2;
        }
      }
    }
    cout<<ans<<endl;
    rep(i,1,SZ(a)+1){
      a[i].clear();
    }
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

