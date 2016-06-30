#include <bits/stdc++.h>

using namespace std;

struct segment {
  int x, y, position;
};

const int N = 2e5 + 1;
int n, fenwick[N];
long long ans[N];

segment S[N];

int cmpx_r(segment a, segment b) { return a.x > b.x; }

int cmpy(segment a, segment b) { return a.y < b.y; }

int lowbit(int x) { return x & -x; }

long long presum(int index) {
  long long ans = 0;

  while (index > 0) {
    ans += fenwick[index];
    index -= lowbit(index);
  }

  return ans;
}

void updateFenwick(int index, int n) {
  while (index <= n) {
    fenwick[index]++;
    index += lowbit(index);
  }
}

int main(void) {

#ifndef ONLINE_JUDGE
  freopen("in.txt", "r", stdin);
#endif

  while (~scanf("%d", &n)) {
    int i;

    memset(fenwick, 0, sizeof(fenwick));

    for (i = 1; i <= n; ++i) {
      scanf("%d%d", &S[i].x, &S[i].y);
      S[i].position = i;
    }

    // compress y
    sort(S + 1, S + n + 1, cmpy);

    for (i = 1; i <= n; ++i) {
      S[i].y = i;
    }

    // sort by x reversely
    sort(S + 1, S + n + 1, cmpx_r);

    for (i = 1; i <= n; ++i) {
      ans[S[i].position] = presum(S[i].y);
      updateFenwick(S[i].y, n);
    }

    for (i = 1; i <= n; ++i) {
      cout << ans[i] << endl;
    }
  }

  return 0;
}
