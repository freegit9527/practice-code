// 2016/07/26 12:15:17 PM
// Sabastian

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <map>

using namespace std;

typedef long long ll;

typedef struct TreeNode {
  int start, end;
  int Min, cnt;
  bool lazy;
  int times;

  TreeNode()
    : cnt(0), lazy(false), times(0) {}

  void merge(TreeNode & left, TreeNode & right) {
    Min = min(left.Min, right.Min);
    cnt = left.cnt + right.cnt;
  }
} TreeNode;

TreeNode tree[4 * 100000 + 10];

typedef struct Point {
  ll value, pos;
} Point;

ll a[4 * 100000 + 10];
Point b[4 * 100000 + 10];

void update(int stIndex, int start, int end);

void printNode(int stIndex) {
  TreeNode &t = tree[stIndex];
  printf("%d (%d, %d), Min=%d\n",
         stIndex, t.start, t.end, t.Min);
}

void build(int stIndex, int start, int end) {
  tree[stIndex].start = start;
  tree[stIndex].end = end;

  if (start == end) {
    tree[stIndex].Min = a[start];
    return;
  }

  int mid = (start + end) / 2, leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  build(leftChildIndex, start, mid);
  build(rightChildIndex, mid + 1, end);
  tree[stIndex].merge(tree[leftChildIndex],
                      tree[rightChildIndex]);
}

void checkLazy(int stIndex, TreeNode & t) {
  int leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  TreeNode & left = tree[leftChildIndex],
    & right = tree[rightChildIndex];
  if (t.lazy) {
    if (t.start != t.end) {
      left.times += t.times;
      right.times += t.times;
      left.lazy = right.lazy = true;
    }
    t.Min -= t.times;
    t.times = 0;
    t.lazy = false;
  }
}

void update(int stIndex, int y) {
  TreeNode & t = tree[stIndex];
  int leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;
  TreeNode & left = tree[leftChildIndex],
    & right = tree[rightChildIndex];

  checkLazy(stIndex, t);

  if (t.Min >= y) {
    t.Min--;
    if (t.start != t.end) {
      left.times++;
      right.times++;
      left.lazy = right.lazy = true;
    }
    return;
  }

  if (t.start == t.end) {
    return;
  }

  update(leftChildIndex, y);
  update(rightChildIndex, y);

  t.merge(tree[leftChildIndex], tree[rightChildIndex]);
  return;
}

void pointUpdate(int stIndex, int index) {
  TreeNode & t = tree[stIndex];
  int leftChildIndex = stIndex * 2, rightChildIndex = leftChildIndex + 1,
    mid = (t.start + t.end) / 2;

  checkLazy(stIndex, t);

  if (index == t.start && index == t.end) {
    t.Min++;
    return;
  }

  if (index <= mid) {
    pointUpdate(leftChildIndex, index);
  }
  else if (index > mid) {
    pointUpdate(rightChildIndex, index);
  }

  t.merge(tree[leftChildIndex], tree[rightChildIndex]);
}

TreeNode query(int stIndex, int x) {
  TreeNode & t = tree[stIndex];
  int leftChildIndex = stIndex * 2,
    rightChildIndex = leftChildIndex + 1;

  TreeNode left = tree[leftChildIndex],
    right = tree[rightChildIndex], result;

  checkLazy(stIndex, t);

  if (t.Min >= x) {
    t.cnt = t.end - t.start + 1;
    result = t;
    return result;
  }

  if (t.start == t.end) {
    t.cnt = 0;
    result = t;
    return result;
  }

  left = query(leftChildIndex, x);
  right = query(rightChildIndex, x);
  result.merge(left, right);

  return result;
}

map<int,int> newpos;

int main(void) {
  #ifdef DEBUG
  freopen("input.txt", "r", stdin);
  #endif

  int N, Q;

  scanf("%d%d", &N, &Q);
  for (int i = 0; i < N; ++i) {
    scanf("%lld", &b[i].value);
    b[i].pos = i;
  }

  sort(b, b + N, [](Point a, Point b) {
      return a.value < b.value;
    });

  for (int ii = 0; ii < N; ++ii) {
    newpos[b[ii].pos] = ii;
    a[ii] = b[ii].value;
  }

  build(1, 0, N - 1);

  for (int m = 1; m <= Q; ++m) {
    int i, x;
    scanf("%d%d", &i, &x);

    if (i == 1) {
      pointUpdate(1, b[x - 1].pos);
    }
    else if (i == 2) {
      // range query
      // it's not ok....
      int start = lower_bound(a, a + N, x) - a;
      printf("%d\n", query(1, start, N - 1).cnt);
    }
    else {
      // binary search
      // it's not ok....
      // range update, each ele - 1
      int start = lower_bound(a, a + N, x) - a;
      update(1, start, N - 1);
    }
  }
  return 0;
}

/*
  1 5
  1 3, 4 5
  1 2, 3, 4, 5
  1, 2
 */
