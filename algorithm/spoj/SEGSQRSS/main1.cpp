// 2016/07/25 14:00:23 PM
// Sabastian
// sum of a[i], not square a[i]

#include <iostream>
#include <math.h>
#include <stdio.h>
#include <string.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
  bool willAdd, willSet;
  ll numAdd, numSet;

  TreeNode() : total(0), willAdd(false), willSet(false), numAdd(0), numSet(0) {}

  void merge(TreeNode &left, TreeNode &right) {
    total = left.afterUpdate() + right.afterUpdate();
  }

  void applyUpdate() {
    total = afterUpdate();
    willSet = willAdd = false;
  }

  ll afterUpdate() {
    if (willSet && willAdd) {
      return (end - start + 1) * numSet + (end - start + 1) * numAdd;
    }

    if (willAdd) {
      return total + (end - start + 1) * numAdd;
    } else if (willSet) {
      return (end - start + 1) * numSet;
    } else {
      return total;
    }
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
    tree[stIndex].total = a[start];
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
      rightChildIndex = leftChildIndex + 1;

  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);

  tree[stIndex].total =
      tree[leftChildIndex].total + tree[rightChildIndex].total;
}

bool NecessaryUpdate(int stIndex) {
  TreeNode &t = tree[stIndex];
  return t.total > (t.end - t.start + 1);
}

void UpdateNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  bool isLeaf = (t.start == t.end);

  if (NecessaryUpdate(stIndex)) {
    if (isLeaf) {
      tree[stIndex].total = floor(sqrt(tree[stIndex].total));
    } else {
      int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1;

      UpdateNode(leftChildIndex);
      UpdateNode(rightChildIndex);
      tree[stIndex].total =
          tree[leftChildIndex].total + tree[rightChildIndex].total;
    }
  }
}

void update(int stIndex, int start, int end, int value, int updateCate) {
  // updateCate 1: add x to range.
  // updateCate 0: set x in range.

  TreeNode &t = tree[stIndex];

  if (start == t.start && end == t.end) {
    if (updateCate) {
      t.numAdd += value;
      t.willAdd = true;
    } else {
      t.numSet = value;
      t.willSet = true;
      t.willAdd = false;
    }
    return;
  }

  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
      mid = (t.start + t.end) / 2;

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
    t.applyUpdate();
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

  int result_len = result.end - result.start + 1;
  if (t.willAdd && t.willSet) {
    result.total = result_len * t.numSet + result_len * t.numAdd;
  }
  else if (t.willSet) {
    result.total = result_len * t.numSet;
  }
  else if (t.willAdd) {
    result.total += result_len * t.numAdd;
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
      }
      else if (op == 1) {
        update(1, st, nd, x, 1);
      }
      else {
        update(1, st, nd, x, 0);
      }
    }
  }

  return 0;
}
