#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

int N, S;
vector<int> a, presum;

void solve() {

  cin >> N >> S;
  presum.clear();
  a.clear();

  a.reserve(N);
  presum.reserve(N + 1);

  for (int i = 0; i < N; ++i) {
    int tmp;
    cin >> tmp;
    a.push_back(tmp);
  }

  // presum[i] means sum of [0, i) elements
  // j > i, presum[j] - presum[i] means sum of [i, j) elements
  presum.push_back(0);

  for (int i = 0; i < N; ++i) {
    presum.push_back(presum[i] + a[i]);
  }

  if (presum[N] < S) {
    cout << 0 << endl;
    return;
  }

  int ans = N;

  for (int i = 0; presum[N] - presum[i] >= S; ++i) {
    int len = distance(presum.begin() + i,
                       lower_bound(presum.begin() + i,
                                   // here can ALSO be presum + N + 1
                                   presum.end(), presum[i] + S));
    ans = min(ans, len);
  }

  cout << ans << endl;
}

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("3061.txt", "r", stdin);
#endif

  int n;

  cin >> n;

  while (n--) {
    solve();
  }
}
