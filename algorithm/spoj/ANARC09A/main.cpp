/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/ANARC09A/
 *
 *        Version:  1.0
 *        Created:  2016年08月14日 14时01分45秒
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

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */
  int T=1;
  string s;while(cin>>s){
    if('-'==s[0])break;
    int cnt=0,sum=0;
    rep(i,0,(int)s.length()){
      if('{'==s[i])sum-=1;
      else{
        if(sum<0)sum++;else cnt++;
      }
    }
    cout<<T<<". ";sum=-sum;
    if(sum&&cnt)cout<<cnt/2+(cnt&1)+sum/2+(sum&1);
    else{if(sum)cout<<sum/2;else cout<<cnt/2;}
    cout<<endl;++T;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

