// 2016/07/25 19:29:33 PM
// Sabastian

#include <iostream>
#include <math.h>
#include <stdio.h>
#include <string.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  int Max, SecMax, sum;

  TreeNode()
    : SecMax(-1) {}

  void merge(TreeNode & left, TreeNode & right) {
    sum = max(left.sum, max(right.sum, left.Max + right.Max));
    Max = max(left.Max, right.Max);
    SecMax = min(left.Max, right.Max);
  }
} TreeNode;

TreeNode tree[4 * 100000 + 10];
ll a[4 * 100000 + 10];

void update(int stIndex, int start, int end);

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("%d (%d, %d), total=%d\n", stIndex, t.start, t.end, t.sum);
}

void build(int stIndex, int start, int end) {
  TreeNode & t = tree[stIndex];

  t.start = start;
  t.end = end;

  if (start == end) {
    t.sum = t.Max = a[start];
    return;
  }

  if (start > end) {
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
      rightChildIndex = leftChildIndex + 1;

  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);

  t.merge(tree[leftChildIndex], tree[rightChildIndex]);
}

void update(int stIndex, int index, int value) {
  TreeNode &t = tree[stIndex];

  // printf("(%d,%d), %d\n", t.start, t.end, index);
  if (index == t.start && index == t.end) {
    t.sum = t.Max = value;
    t.SecMax = -1;
    return;
  }

  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
      mid = (t.start + t.end) / 2;

  if (index > mid) {
    update(rightChildIndex, index, value);
  } else {
    update(leftChildIndex, index, value);
  }

  t.merge(tree[leftChildIndex], tree[rightChildIndex]);

  return;
}

TreeNode query(int stIndex, int start, int end) {
  TreeNode t = tree[stIndex];

  if (start == t.start && end == t.end) {
    return t;
  }

  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
      mid = (t.start + t.end) / 2;
  TreeNode result;

  if (start > mid) {
    return query(rightChildIndex, start, end);
  } else if (end <= mid) {
    return query(leftChildIndex, start, end);
  } else {
    TreeNode left = query(leftChildIndex, start, mid),
      right = query(rightChildIndex, mid + 1, end);
    result.merge(left, right);
    return result;
  }
}

int main(void) {
#ifdef DEBUG
  freopen("input.txt", "r", stdin);
#endif

  int N, M;

  scanf("%d", &N);
  for (int i = 0; i < N; ++i) {
    scanf("%lld", &a[i]);
  }

  build(1, 0, N - 1);
  scanf("%d", &M);
  for (int m = 1; m <= M; ++m) {
    int x, y;
    char i[10];
    scanf("%s%d%d", i, &x, &y);

    x--;
    if (i[0] == 'Q') {
      y--;
      printf("%d\n", query(1, x, y).sum);
    } else {
      update(1, x, y);
    }
  }
  return 0;
}
