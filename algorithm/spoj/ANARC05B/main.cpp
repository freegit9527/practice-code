/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/ANARC05B/
 *
 *        Version:  1.0
 *        Created:  08/12/2016 23:59:07
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
const int N=10000+10;
int a1[N],a2[N];
bool b1[N],b2[N];
int n,m;

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  while(cin>>n&&n){
    memset(b1,false,sizeof(b1));
    memset(b2,false,sizeof(b2));
    rep(i,1,n+1)cin>>a1[i];
    cin>>m;
    rep(i,1,m+1)cin>>a2[i];
    rep(i,1,n+1){
      int pos=lower_bound(a2+1,a2+m+1,a1[i])-a2;
      if(pos!=m+1){
        if(a2[pos]==a1[i])b1[i]=b2[pos]=true;
      }
    }
    int i=0,j=0;ll s1,s2,result=0;
    while(true){
      s1=s2=0;
      while(i<=n&&!b1[i])s1+=a1[i++];
      while(j<=m&&!b2[j])s2+=a2[j++];
      result+=max(s1,s2);
      if(b1[i]&&b2[j])result+=a1[i];
      ++i;++j;
      if(i>n&&j>m)break;
    }
    cout<<result<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

