#include <bits/stdc++.h>
using namespace std;
using ll=long long;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
const ll MOD=1000000007;

const int maxN = 35;
struct Block{
  ll width, length, height;
};
Block block[maxN*3];
int n,cnt;
ll dp[maxN];

ll func_dp(int i) {
  if (dp[i]) {
    return dp[i];
  }
  ll &ans = block[i].height;
  for (auto j = 1; j < cnt; ++j) {
    if(block[i].width > block[j].width &&
       block[i].length > block[j].length) {
      ans = max(ans, block[i].height + func_dp(j));
    }
  }
  return ans;
}

int main ( void )
{
  _
#ifndef  ONLINE_JUDGE
    freopen("uva437_in.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

  while (cin >> n) {
    int a[4];
    cnt = 1;

    for (auto i = 1; i < n + 1; ++i) {
      cin >> a[0] >> a[1] >> a[2];
      sort(a, a + 3);

      block[cnt].width = a[0];
      block[cnt].length = a[1];
      block[cnt].height = a[2];

      cnt++;
      block[cnt].width = a[0];
      block[cnt].length = a[2];
      block[cnt].height = a[1];

      cnt++;
      block[cnt].width = a[1];
      block[cnt].length = a[2];
      block[cnt].height = a[0];

      cnt++;
    }

    sort(block, block + cnt, [](Block a, Block b){
        return a.width <= b.width && a.length <= b.length;
      });
    memset(dp, 0, sizeof(dp));

    ll ans = 0;
    for (auto i = 1; i < cnt; ++i) {
      ans = max(ans, func_dp(i));
    }
    cout << ans << endl;
  }

  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
