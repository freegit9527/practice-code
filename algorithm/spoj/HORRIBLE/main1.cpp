// 2016/07/24 15:26:04 PM
// Sabastian

#include <iostream>
#include <stdio.h>
#include <string.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
  ll lazy;

  void merge(TreeNode & left, TreeNode & right) {
    total = left.total + right.total;
    total += left.lazy * (left.end - left.start + 1) +
      right.lazy * (right.end - right.start + 1);
  }

} TreeNode;

TreeNode tree[4 * 100000 + 10];

void build(int stIndex, int start, int end) {
  TreeNode &t = tree[stIndex];
  t.start = start;
  t.end = end;
  t.total = t.lazy = 0;

  if (start == end) {
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
      rightChildIndex = leftChildIndex + 1;

  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);
  t.merge(tree[leftChildIndex], tree[rightChildIndex]);
}

void update(int stIndex, int start, int end, ll value) {
  TreeNode & t = tree[stIndex];

  if (t.start == start && t.end == end) {
    t.lazy += value;
    return;
  }

  int mid = (t.start + t.end) / 2, leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;

  if (end <= mid) {
    update(leftChildIndex, start, end, value);
  }
  else if (start > mid) {
    update(rightChildIndex, start, end, value);
  }
  else {
    update(leftChildIndex, start, mid, value);
    update(rightChildIndex, mid + 1, end, value);
  }

  t.merge(tree[leftChildIndex], tree[rightChildIndex]);
}

TreeNode query(int stIndex, int start, int end) {
  TreeNode t = tree[stIndex];

  if (t.start == start && t.end == end) {
    t.total += t.lazy * (t.end - t.start + 1);
    t.lazy = 0;
    return t;
  }

  int mid = (t.start + t.end) / 2, leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  TreeNode result;

  if (end <= mid) {
    result = query(leftChildIndex, start, end);
  }
  else if (start > mid) {
    result = query(rightChildIndex, start, end);
  }
  else {
    TreeNode left, right;

    left = query(leftChildIndex, start, mid);
    right = query(rightChildIndex, mid + 1, end);

    result.start = left.start;
    result.end = right.end;
    result.merge(left, right);
  }

  result.total += t.lazy * (result.end - result.start + 1);

  return result;
}

int main(void) {
#ifdef DEBUG
  freopen("input.txt", "r", stdin);
#endif

  int T, N, C;

  cin >> T;
  while (T--) {
    cin >> N >> C;
    build(1, 0, N - 1);

    while (C--) {
      int op, p, q;
      int v;

      cin >> op;
      if (op) {
        // query
        cin >> p >> q;
        p--;
        q--;
        cout << query(1, p, q).total << endl;
      } else {
        cin >> p >> q >> v;
        p--;
        q--;
        update(1, p, q, v);
      }
    }
  }
  return 0;
}
