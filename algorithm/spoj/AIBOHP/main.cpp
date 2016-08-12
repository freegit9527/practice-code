/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/AIBOHP/
 *
 *        Version:  1.0
 *        Created:  08/12/2016 18:27:30
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
const ll MOD=1000000007;
const int N=6120;
int a[N][N];
char s[N],t[N],str[N];
  int
main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  int T;cin>>T;while(T--){
    memset(a,0,sizeof(a));
    cin>>str;int len=strlen(str);
    rep(i,0,len)s[i+1]=str[i];
    rep(i,1,len+1)t[len+1-i]=s[i];
    rep(i,1,len+1){
      rep(j,1,len+1){
        if(s[i]==t[j]){
          a[i][j]=max(a[i][j],a[i-1][j-1]+1);
        }
        else {
          int mm=max(a[i-1][j],a[i][j-1]);
          a[i][j]=max(a[i][j],mm);
        }
      }
    }
    cout<<len-a[len][len]<<endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

