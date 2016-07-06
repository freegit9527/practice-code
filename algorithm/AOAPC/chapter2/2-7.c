#include <stdio.h>
#include <time.h>

int main(void) {
  int n, tmp = 1, ans = 0;
  const int N = 1000000;

  scanf("%d", &n);
  for (int i = 1; i <= n; ++i) {
    tmp = tmp * i;
    tmp = tmp % N;
    ans = (ans + tmp) % N;
  }
  printf("%d\n", ans);
  // printf("%.2f\n", (double)clock() / CLOCKS_PER_SEC);

  return 0;
}
