#include <algorithm>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <cstring>

using namespace std;

const int N = 100000+10;
typedef long long ll;
int a[N], par[N], p[N];
ll ans[N], sum[N];
bool use[N];

int find(int i) {
  while (i != par[i]) {
    i = par[i];
  }
  return par[i];
}

void merge(int i, int j) {
  int pi = find(i),
    pj = find(j);
  par[pi] = pj;
  sum[pj] += sum[pi];
  return;
}

int main()
{
  #ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
  #endif
  int n;
  while (cin >> n) {
    for (int i = 1; i <= n; ++i) cin >> a[i];
    for (int i = 1; i <= n; ++i) cin >> p[i];

    for (int i = 1; i <= n; ++i) {
      par[i] = i;
      sum[i] = a[i];
    }
    
    ans[n] = 0;
    memset(use, false, sizeof(use));
    ll ans2 = 0;
    for (int i = n - 1; i >= 1; --i) {
      int parent = find(p[i]);
      ll tmp = sum[parent],
        tmp1 = 0, tmp2 = 0;
      ans2 = max(ans2, tmp);
      if (i > 1 && use[i-1]) {
        tmp1 = sum[find(i-1)];
      }
      if (i < n && use[i+1]) {
        tmp2 = sum[find(i+1)];
      }
      tmp += tmp1 + tmp2;
      use[i] = true;
      ans[i] = max(ans2, tmp);
    }
    for (int i = 1; i <= n; ++i) {
      cout << ans[i] << endl;
    }
  }
  
  return 0;
}
