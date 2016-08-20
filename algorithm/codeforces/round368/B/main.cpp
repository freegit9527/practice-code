/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  08/20/2016 21:25:19
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
int n,m,k,ans;
vector<vector<PII> > a(100000+10);
MI sto;

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  while(cin>>n>>m>>k){
    a.clear();
    sto.clear();
    int u,v,l;
    rep(i,0,m){
      cin>>u>>v>>l;
      a[u].push_back(mp(v,l));
    }
    rep(i,0,k){
      cin>>u;
      sto[u]=1;
    }
    ll ans=(int)(1e9+1);
    bool mark=false;
    rep(i,1,n+1){
      rep(j,0,SZ(a[i])){
        if((sto[i]!=1&&sto[a[i][j].first]==1)||
            (sto[i]==1&&sto[a[i][j].first]!=1)){
          if(ans>a[i][j].second){
            ans=a[i][j].second;
            mark=true;
          }
        }
      }
    }
    cout<<(mark?ans:-1)<<endl;
    rep(i,1,n+1){
      a[i].clear();
    }
  }


  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

