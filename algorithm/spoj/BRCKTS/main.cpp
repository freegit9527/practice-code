#include <iostream>

using namespace std;

struct SegmentTreeNode {
  int unmatchedLeft, unmatchedRight;

  void assignLeaf(char value) {
    if (value == '(') {
      unmatchedLeft = 1;
      unmatchedRight = 0;
    }
    else {
      unmatchedLeft = 0;
      unmatchedRight = 1;
    }
  }

  void merge(SegmentTreeNode &left, SegmentTreeNode &right) {
    int L_unl = left.unmatchedLeft, L_unr = left.unmatchedRight,
      R_unl = right.unmatchedLeft, R_unr = right.unmatchedRight;
    int matched = min(L_unl, R_unr);
    unmatchedLeft = L_unl + R_unl - matched;
    unmatchedRight = L_unr + R_unr - matched;
    return;
  }

  bool getValue() { return unmatchedRight == 0 && unmatchedLeft == 0; }
};

template <class T, class V> class SegmentTree {
  SegmentTreeNode *nodes;
  int N;

public:
  SegmentTree(T arr[], int N) {
    this->N = N;
    nodes = new SegmentTreeNode[getSegmentTreeSize(N)];
    buildTree(arr, 1, 0, N - 1);
  }

  ~SegmentTree() { delete[] nodes; }

  V getValue(int lo, int hi) {
    SegmentTreeNode result = getValue(1, 0, N - 1, lo, hi);
    return result.getValue();
  }

  void update(int index, T value) { update(1, 0, N - 1, index, value); }

private:
  void buildTree(T arr[], int stIndex, int lo, int hi) {
    if (lo == hi) {
      nodes[stIndex].assignLeaf(arr[lo]);
      return;
    }

    int left = 2 * stIndex, right = left + 1, mid = (lo + hi) / 2;

    buildTree(arr, left, lo, mid);
    buildTree(arr, right, mid + 1, hi);

    nodes[stIndex].merge(nodes[left], nodes[right]);
  }

  SegmentTreeNode getValue(int stIndex, int left, int right, int lo, int hi) {
    if (left == lo && right == hi) {
      return nodes[stIndex];
    }

    int mid = (left + right) / 2;

    if (lo > mid) {
      return getValue(2 * stIndex + 1, mid + 1, right, lo, hi);
    }
    if (hi < mid + 1) {
      return getValue(2 * stIndex, left, mid, lo, hi);
    }

    SegmentTreeNode leftResult = getValue(2 * stIndex, left, mid, lo, mid);
    SegmentTreeNode rightResult =
        getValue(2 * stIndex + 1, mid + 1, right, mid + 1, hi);
    SegmentTreeNode result;

    result.merge(leftResult, rightResult);
    return result;
  }

  void update(int stIndex, int lo, int hi, int index, T value) {
    if (lo == hi) {
      nodes[stIndex].assignLeaf(value);
      return;
    }

    int left = 2 * stIndex, right = left + 1, mid = (lo + hi) / 2;

    if (index <= mid) {
      update(left, lo, mid, index, value);
    } else {
      update(right, mid + 1, hi, index, value);
    }

    nodes[stIndex].merge(nodes[left], nodes[right]);
  }

  int getSegmentTreeSize(int N) {
    int size = 1;
    while (size < N) {
      size <<= 1;
    }
    return size << 1;
  }
};

int a[30000];
char str[30000];

int main() {
#ifdef DEBUG
  freopen("input.txt", "r", stdin);
#endif

  int N;
  int t = 1;
  while (scanf("%d", &N) != EOF) {
    printf("Test %d:\n", t++);
    scanf("%s", str);

    SegmentTree<char, bool> st(str, N);

    int M;
    scanf("%d", &M);

    while (M--) {
      int pos;

      scanf("%d", &pos);

      if (pos) {
        pos--;

        if (str[pos] == '(') {
          st.update(pos, ')');
          // don't forget this
          str[pos] = ')';
        }
        else {
          st.update(pos, '(');
          str[pos] = '(';
        }
      }
      else {
        printf("%s\n", st.getValue(0, N - 1) ? "YES" : "NO");
      }
    }
  }
  return 0;
}
