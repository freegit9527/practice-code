#include <iostream>
#include <stdio.h>
#include <algorithm>

using namespace std;

typedef struct Node {
    int left;
    int right;

    int minSum;
    int maxSum;

    int bestSum;
} Node;

int N, x, y, M;
int a[50000+100];
int sum[50000+100];
Node segt[50001*4+100];

void buildSegtree(int index, int low, int high) {
    if (low == high) {
        segt[index].left = segt[index].right = low;
        segt[index].maxSum = sum[low];
        segt[index].minSum = sum[low];
        segt[index].bestSum = sum[low];

        return;
    }
    int mid = (low + high) / 2;
    buildSegtree(index * 2, low, mid);
    buildSegtree(index * 2 + 1, mid + 1, high);

    segt[index].left = low;
    segt[index].right = high;
    segt[index].maxSum = max(segt[index * 2].maxSum, segt[index * 2 + 1].maxSum);
    segt[index].minSum = min(segt[index * 2].minSum, segt[index * 2 + 1].minSum);
    segt[index].bestSum = max(segt[index * 2].bestSum,
                                max(segt[index * 2 + 1].bestSum,
                                segt[index * 2 + 1].maxSum - segt[index * 2].minSum));

    return;
}

int getBestSumSegtree(int index, int left, int right, int mark) {
    int nodeLeft = segt[index].left, nodeRight = segt[index].right;

    if ((nodeLeft == left && nodeRight == right) || nodeLeft == nodeRight) {
        if (mark == 3) {
            return segt[index].bestSum;
        } else if (mark == 1) {
            return segt[index].minSum;
        } else {
            return segt[index].maxSum;
        }
    }

    int childNodeRight = segt[index * 2].right;

    if (childNodeRight >= right) {
//        go to left
        return getBestSumSegtree(index * 2, left, right, mark);
    }
    else if (childNodeRight >= left) {
        int leftBestSum, rightBestSum,
            leftMinSum, rightMinSum,
            leftMaxSum, rightMaxSum;

        leftMinSum = getBestSumSegtree(index * 2, left, childNodeRight, 1);
        rightMaxSum = getBestSumSegtree(index * 2 + 1, childNodeRight + 1, right, 2);

        if (mark == 3) {
            leftBestSum = getBestSumSegtree(index * 2, left, childNodeRight, 3);
            rightBestSum = getBestSumSegtree(index * 2 + 1, childNodeRight + 1, right, 3);

            return max(leftBestSum,
                       max(rightBestSum, rightMaxSum - leftMinSum));
        } else if (mark == 1) {
            rightMinSum = getBestSumSegtree(index * 2 + 1, childNodeRight + 1,
                                                right, 1);
            return min(leftMinSum, rightMinSum);
        } else {
            leftMaxSum = getBestSumSegtree(index * 2, left,
                                               childNodeRight, 2);
            return max(leftMaxSum, rightMaxSum);
        }
    }
    else {
//        go to right
        return getBestSumSegtree(index * 2 + 1, left, right, mark);
    }
}

int main() {
#ifdef DEBUG
    freopen("/Users/liu/Hack/algorithm/spoj/GSS1/input.txt", "r", stdin);
#endif

    scanf("%d", &N);

    for (int i = 0; i < N; ++i) {
        scanf("%d", &a[i + 1]);
        sum[i + 1] = sum[i] + a[i + 1];
    }

    buildSegtree(1, 1, N);
//    printf("(1,2) = %d\n", getMaxSumSegtree(1, 1, 2));
//    printf("(1,3) = %d\n", getMaxSumSegtree(1, 1, 3));
//    printf("(2,3) = %d\n", getMaxSumSegtree(1, 2, 3));

//    for (int i = 1; i <= 2 * N + 1; ++i) {
//        printf("%d ", segt[i].maxSum);
//    }
//    printf("\n");

    scanf("%d", &M);

    while (M--) {
        scanf("%d%d", &x, &y);
        printf("%d\n", getBestSumSegtree(1, x, y, 3));
//        printf("x = %d, y =%d\n", x, y);
    }

    return 0;
}