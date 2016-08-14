/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.spoj.com/problems/ASSIGN/
 *
 *        Version:  1.0
 *        Created:  2016年08月14日 11时19分34秒
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
const ll N=1<<20;
int b[25][N];
ll a[25][N];
int n;

int cnt1(ll n){int cnt=0;while(n){if(n&1) ++cnt;n/=2;}return cnt;}

int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

    int T;cin>>T;while(T--) {
        cin>>n; rep(i,1,n+1) rep(j,1,n+1) cin>>b[i][j];
        memset(a,0,sizeof(a));
        a[n+1][(1<<n)-1]=1;
        per(i,1,n+1)
        rep(j,1,n+1) {
            if(b[i][j]) {
                rep(mask,0,(1<<n)) if(cnt1(mask)==i-1) {
                    if((mask&(1<<(j-1)))==0) {
                        a[i][mask]+=a[i+1][mask|(1<<(j-1))];
    //                    cout<<"i="<<i<<",mask="<<mask<<",a[i][mask]="<<a[i][mask]<<" "<<endl;
                    }
                }
            }
        }

        cout<<a[1][0]<<endl;
    }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

