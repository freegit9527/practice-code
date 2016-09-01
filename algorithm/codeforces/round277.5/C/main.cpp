/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  08/21/2016 23:27:13
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
int a[120],b[120],c[120],m,s;
int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  while(cin>>m>>s){
    if(!s){
      if(1==m){
        cout<<"0 0"<<endl;
      }
      else{
        cout<<"-1 -1"<<endl;
      }
      continue;
    }
    if(s>9*m){
      cout<<"-1 -1"<<endl;
      continue;
    }
    int _s=s,cur;

    memset(a,0,sizeof(a));
    memset(b,0,sizeof(b));

    rep(i,1,m){
      rep(j,0,10){
        if(1==i&&!j)continue;
        if((_s-j)<=9*(m-i)){
          cur=j;
          _s-=j;
          break;
        }
      }
      a[i]=cur;
    }
    a[m]=_s;

    _s=s;
    rep(i,1,m+1){
      b[i]=min(9,_s);
      _s-=b[i];
    }
    //---
    rep(i,1,m+1){
      cout<<a[i];
    }
    cout<<" ";
    rep(i,1,m+1){
      cout<<b[i];
    }
    cout<<endl;
  }


  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

