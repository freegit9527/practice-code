#include <stdio.h>

int N, S;
int a[100 * 1000 + 10];

void solve() {
  scanf("%d%d", &N, &S);
  for (int i = 0; i < N; ++i) {
    scanf("%d", a + i);
  }
  int i = 0, j = 0, sum = 0, ans = N + 1;
  while (1) {
    while (sum < S && j < N) {
      sum += a[j];
      ++j;
    }
    if (sum < S) {
      break;
    }
    ans = (ans < j - i) ? ans : j - i;
    sum -= a[i];
    ++i;
  }
  if (ans == N + 1) {
    ans = 0;
  }
  printf("%d\n", ans);

  return;
}

int main(void) {
  int n;
  scanf("%d", &n);
  while (n--) {
    solve();
  }
  return 0;
}
