/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  2016/08/29 20时22分36秒
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
const int N=508;
ll a[N][N];
int n;

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  while(cin>>n){
    memset(a,0,sizeof(a));
    ll sum=0,sum1=0,res=0;
    int posi=0,posj=0;
    bool mark=true;

    rep(i,1,n+1){
      rep(j,1,n+1){
        cin>>a[i][j];
        if(0==a[i][j]){
          posi=i;posj=j;
        }
      }
    }

    rep(i,1,n+1){
      if(i!=posi){
        rep(j,1,n+1)sum+=a[i][j];
        break;
      }
    }

    rep(j,1,n+1)sum1+=a[posi][j];
    res=sum-sum1;
    a[posi][posj]=res;

    ll tmpSum=0;
    // each row
    rep(i,1,n+1){
      tmpSum=0;
      rep(j,1,n+1) tmpSum+=a[i][j];
      if(tmpSum!=sum){
        mark=false;break;
      }
    }

    // each column
    rep(j,1,n+1){
      tmpSum=0;
      rep(i,1,n+1)tmpSum+=a[i][j];
      if(tmpSum!=sum){
        mark=false;break;
      }
    }

    // diag
    tmpSum=0;
    rep(i,1,n+1)tmpSum+=a[i][i];
    if(tmpSum!=sum){
      mark=false;
    }

    // sec diag
    tmpSum=0;
    rep(i,1,n+1)tmpSum+=a[i][n+1-i];
    if(tmpSum!=sum){
      mark=false;
    }

    // if it is neg
    // 这个bug一直没有发现。。需要判断是不是负数和0。
    if(res<=0)mark=false;

    if(1==n)cout<<1<<endl;
    else {
      if(mark)cout<<res<<endl;
      else cout<<-1<<endl;
    }
  }
  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

