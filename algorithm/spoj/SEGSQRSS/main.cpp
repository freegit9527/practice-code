// 2016/07/25 14:00:23 PM
// Sabastian

#include <iostream>
#include <math.h>
#include <stdio.h>
#include <string.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
  bool willSet;
  ll numSet;
  ll value;

  TreeNode() : total(0), willSet(false), numSet(0), value(0) {}

  void merge(TreeNode &left, TreeNode &right) {
    total = left.total + right.total;
  }
} TreeNode;

TreeNode tree[4 * 100000 + 10];
ll a[4 * 100000 + 10];

void update(int stIndex, int start, int end);

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("%d (%d, %d), total=%lld\n", stIndex, t.start, t.end, t.total);
}

void build(int stIndex, int start, int end) {
  tree[stIndex].start = start;
  tree[stIndex].end = end;

  if (start == end) {
    tree[stIndex].total = a[start] * a[start];
    tree[stIndex].value = a[start];
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
      rightChildIndex = leftChildIndex + 1;

  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);

  tree[stIndex].total =
      tree[leftChildIndex].total + tree[rightChildIndex].total;
}

void update(int stIndex, int start, int end, int value, int updateCate) {
  // updateCate 1: add x to range.
  // updateCate 0: set x in range.

  TreeNode &t = tree[stIndex];
  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
      mid = (t.start + t.end) / 2;

  if (start == t.start && end == t.end) {
    if (t.start == t.end) {
      // printf(" value=%d, <value=%lld,total=%lld>\n",
      //        value, t.value,t.total);

      if (updateCate) {
        t.value += value;
      }
      else {
        t.value = value;
      }

      t.total = t.value * t.value;
    } else {
      update(leftChildIndex, start, mid, value, updateCate);
      update(rightChildIndex, mid + 1, end, value, updateCate);
      t.merge(tree[leftChildIndex], tree[rightChildIndex]);
    }
    return;
  }

  if (start > mid) {
    update(rightChildIndex, start, end, value, updateCate);
  } else if (end <= mid) {
    update(leftChildIndex, start, end, value, updateCate);
  } else {
    update(leftChildIndex, start, mid, value, updateCate);
    update(rightChildIndex, mid + 1, end, value, updateCate);
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
    result = query(rightChildIndex, start, end);
  } else if (end <= mid) {
    result = query(leftChildIndex, start, end);
  } else {
    TreeNode left, right;

    left = query(leftChildIndex, start, mid);
    right = query(rightChildIndex, mid + 1, end);

    result.merge(left, right);
    result.start = left.start;
    result.end = right.end;
  }
  return result;
}

int main(void) {
#ifdef DEBUG
  freopen("input.txt", "r", stdin);
#endif

  int T, Q, N;

  scanf("%d", &T);

  for (int cc = 1; cc <= T; ++cc) {
    printf("Case %d:\n", cc);
    scanf("%d%d", &N, &Q);

    for (int i = 0; i < N; ++i) {
      scanf("%lld", &a[i]);
    }

    build(1, 0, N - 1);

    for (int m = 1; m <= Q; ++m) {
      int op, st, nd, x;

      scanf("%d%d%d", &op, &st, &nd);
      st--;
      nd--;

      if (op != 2) {
        scanf("%d", &x);
      }

      if (op == 2) {
        printf("%lld\n", query(1, st, nd).total);
      } else if (op == 1) {
        update(1, st, nd, x, 1);
      } else {
        update(1, st, nd, x, 0);
      }
    }
  }

  return 0;
}
