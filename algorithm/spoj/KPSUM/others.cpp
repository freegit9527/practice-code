/*
 * =====================================================================================
 *
 *       Filename:  others.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/16/2016 15:45:23
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
ll n, x, ans;  
int c;  

ll pow(int x, int t)  
{  
    if (t <= 0) return 1;  
    if (t == 1) return x;  
    if (t & 1) return x * pow(x, t - 1);  
    ll r = pow(x, t >> 1);  
    return r * r;  
}  
  
int g(int x)  
{  
    int ret = 0;  
    for (int i = 1; i <= n; ++i)  
        ret += (-1 + (i & 1) * 2) * i;  
    return ret;  
}  
  
ll b(ll x)  
{ return x < 0 ? 0 : x; }  
int main ( void )
{
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
    freopen("output3.txt", "w", stdout);  
#endif     /* -----  ONLINE_JUDGE  ----- */

    while (scanf("%lld", &n))  
    {  
        if (!n) break;  
        ans = 0LL;  
        for (x = n, c = 0; x; x /= 10, ++c) ;  
        if (n < 10)  
        {  
            printf("%d\n", g(n));  
            continue;  
        }  
        ans += 5;  
        for (int i = 2; i < c; ++i)  
            if (i & 1)      //Odd  
                ans += pow(10, i - 3) * (ll)450;  
            else            //Even  
                ans -= pow(10, i - 2) * (ll)45;  
        ll left = n + 1 - pow(10, c - 1);  
        if (left)  
        {  
            if (c & 1)      //Odd  
            {  
                if (left & 1)  
                    for (int i = 1; i <= c; ++i)  {

                        if (i & 1)  
                            ans -= n % pow(10, c - i + 1) / pow(10, c - i);  
                        else  
                            ans += n % pow(10, c - i + 1) / pow(10, c - i);  
                    }
                ans += left >> 1;  
            }  
            else            //Even  
            {  
                int num[20], tot = 0;  
                for (x = n; x; num[++tot] = x % 10, x /= 10) ;  
                ll nx = n - pow(10, tot - 1);  
                for (int i = 1; i <= tot; ++i)  
                {  
                    ll sign = -(-1LL + (ll)(i & 1) * 2LL);  
                    ans += sign * b(nx / pow(10, tot - i + 1)) * pow(10, tot - i) * 45LL;  
                    ans += sign * b((num[tot - i + 1]) * (num[tot - i + 1] - 1) >> 1) * pow(10, tot - i);  
                    ans += sign * num[tot - i + 1] * (n % pow(10, tot - i) + 1);  
                }  
            }  
        }  
        printf("%lld\n", ans);  
    }  

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
  
