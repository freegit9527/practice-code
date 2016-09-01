/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  [>0;95;0c]
 *
 *        Version:  1.0
 *        Created:  2016/08/29 20时03分24秒
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
const int N=1002;
char a[N][10];
int n;
int main ( void )
{_
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  int n;
  while(cin>>n){
    rep(i,0,n)cin>>a[i];
    int r1=-1,c1=-1;
    rep(i,0,n){
      if(a[i][0]==a[i][1]&&a[i][0]=='O'){
        r1=i;
        c1=0;
        break;
      }
      if(a[i][3]==a[i][4]&&a[i][3]=='O'){
        r1=i;
        c1=3;
        break;
      }
    }
    if(-1==c1){
      cout<<"NO"<<endl;
    }
    else{
      cout<<"YES"<<endl;
      rep(i,0,n){
        if(r1==i){
          for(int j=0;j<5;++j){
            if(j==c1){
              cout<<"++";
              ++j;
            }
            else cout<<a[i][j];
          }
        }
        else cout<<a[i];
        cout<<endl;
      }
    }
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

