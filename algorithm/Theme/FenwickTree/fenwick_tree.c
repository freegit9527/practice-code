#include <stdio.h>

const int N = 6;
int a[N] = {0, 1, 2, 3, 4, 5};
int fenwick[N];

int lowbit(int x) {
  return x & (-x);
}

void build_fenwick_tree() {
    for (int i = 1; i < N; ++i) {
      fenwick[i] = a[i];
      for (int j = i - 1; j > i - lowbit(i); --j) {
        fenwick[i] += a[j];
      }
  }
}

void update_fenwick_tree(int index, int delta) {
  while (index < N) {
    fenwick[index] += delta;
    index += lowbit(index);
  }
}

int sum_fenwick_tree(int index) {
  int ans = 0;
  while (index > 0) {
    ans += fenwick[index];
    index -= lowbit(index);
  }
  return ans;
}

void print_fenwick_tree() {
  for (int i = 1; i < N; ++i) {
    printf("%d ", fenwick[i]);
  }
  printf("\n");
}

int main(void) {
  build_fenwick_tree();
  print_fenwick_tree();

  update_fenwick_tree(3, 3);
  print_fenwick_tree();

  printf("%d\n", sum_fenwick_tree(4));
  printf("%d\n", sum_fenwick_tree(5));

  return 0;
}
