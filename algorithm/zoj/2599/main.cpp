/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/17/2016 11:31:03
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
ll dp[30][300];
void initDp(){
  memset(dp,0,sizeof(dp));
  rep(i,0,10)dp[1][i]=1;
  rep(i,2,20){
    rep(j,0,200){
      rep(k,0,min(9,j)+1) dp[i][j]+=dp[i-1][j-k];
    }
  }
}
// . return nubmer of those whoes number length is len,digit sum is sum
ll getSum1(int len,int sum){return dp[len][sum];}
ll getSum2(int n,int sum){
  // return numbers in [1..n] whose digit sum is sum
  ll ans=0;int d=0,a[20];while(n){a[d++]=n%10;n/=10;}
  rep(j,1,d)rep(i,0,a[d-j])ans+=dp[d-j][sum--];
  rep(i,0,a[0]+1)if(sum==i)++ans;
  return ans;
}

int main ( void )
{
#ifndef  ONLINE_JUDGE
//  freopen("input.txt", "r", stdin);
//  freopen("output1.txt","w",stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
  initDp();

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

