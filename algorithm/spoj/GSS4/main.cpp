// 2016/07/22 19:58:12 PM
// Sabastian

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <math.h>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  ll total;
} TreeNode;

TreeNode tree[4 * 100000 + 10];
ll a[4 * 100000 + 10];

void update(int stIndex, int start, int end);

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("%d (%d, %d), total=%lld\n",
         stIndex, t.start, t.end, t.total);
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
  tree[stIndex].total = tree[leftChildIndex].total +
    tree[rightChildIndex].total;
}

bool NecessaryUpdate(int stIndex) {
  TreeNode & t = tree[stIndex];
  return t.total > (t.end - t.start + 1);
}

void UpdateNode(int stIndex) {
  TreeNode & t = tree[stIndex];
  bool isLeaf = (t.start == t.end);

  if (NecessaryUpdate(stIndex)) {
    if (isLeaf) {
      tree[stIndex].total = floor(sqrt(tree[stIndex].total));
    }
    else {
      int leftChildIndex = stIndex * 2,
        rightChildIndex = leftChildIndex + 1;

      UpdateNode(leftChildIndex);
      UpdateNode(rightChildIndex);
      tree[stIndex].total = tree[leftChildIndex].total +
        tree[rightChildIndex].total;
    }
  }
}

void update(int stIndex, int start, int end) {

  TreeNode & t = tree[stIndex];

  if (start == t.start && end == t.end) {
    UpdateNode(stIndex);
    return;
  }

  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
    mid = (t.start + t.end) / 2;

  if (start > mid) {
    update(rightChildIndex, start, end);
  }
  else if (end <= mid) {
    update(leftChildIndex, start, end);
  }
  else {
    update(leftChildIndex, start, mid);
    update(rightChildIndex, mid + 1, end);
  }

  t.total = tree[leftChildIndex].total + tree[rightChildIndex].total;

  return;
}

ll query(int stIndex, int start, int end) {
  TreeNode & t = tree[stIndex];

  if (start == t.start && end == t.end) {
    return t.total;
  }

  // node contain is contained in [start..end]
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
    mid = (t.start + t.end) / 2;

  if (start > mid) {
    return query(rightChildIndex, start, end);
  }
  else if (end <= mid) {
    return query(leftChildIndex, start, end);
  }
  else {
    return query(leftChildIndex, start, mid) +
      query(rightChildIndex, mid + 1, end);
  }
}

int main(void) {
  #ifdef DEBUG
  freopen("input.txt", "r", stdin);
  #endif

  int N, M;

  int c = 1;
  while (~scanf("%d", &N)) {
    printf("Case #%d:\n", c);
    ++c;
    for (int i = 0; i < N; ++i) {
      scanf("%lld", &a[i]);
    }

    build(1, 0, N - 1);
    scanf("%d", &M);
    for (int m = 1; m <= M; ++m) {
      int i, x, y;
      scanf("%d%d%d", &i, &x, &y);

      if (x > y) {
        swap(x, y);
      }

      x--; y--;
      if (i) {
        printf("%lld\n", query(1, x, y));
      }
      else {
        update(1, x, y);
      }
    }
    printf("\n");
  }
  return 0;
}
