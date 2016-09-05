/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  dfs
 *
 *        Version:  1.0
 *        Created:  2016/09/03 18时10分31秒
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

const int N=100000*2+10;
ll cal[N];
int n,a[N],b[N];
int cycle_len;

void dfs1(int i){
  if(1==b[i]){
    return;
  }
  cycle_len++;
  b[i]=1;
  dfs1(a[i]);
}

int dfs(int i){
  if(2==b[i]){
    dfs1(i);
    return 0;
  }
  else if(1==b[i]){
    return 0;
  }
  b[i]=2;
  int tmp=dfs(a[i]);
  b[i]=1;
  return 1+tmp;
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  cal[0]=1;
  cal[1]=2;
  rep(i,2,N+1){
    cal[i]=(cal[i-1]*2)%MOD;
  }

  while(cin>>n){
    rep(i,1,n+1)cin>>a[i];
    memset(b,0,sizeof(b));
    ll res=1;
    rep(i,1,n+1){
      if(!b[i]){
        int sum_len=0,path_len=0;
        cycle_len=0;
        sum_len=dfs(i);
        if(!sum_len)continue;
        if(cycle_len){                           /* circle */
          path_len=sum_len-cycle_len;
          res=(res*cal[path_len])%MOD;
          ll res1=(res*cal[cycle_len])%MOD,
             res2=(res*2)%MOD;
          res=(res1-res2+MOD)%MOD;
        }
        else{
          // line
          res=(res*cal[sum_len])%MOD;
        }
      }
    }
    cout<<res<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

