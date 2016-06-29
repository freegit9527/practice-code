#include <stdio.h>

int a[51][51];
int book[51][51], n, m, sum;

void dfs(int x, int y)
{
        int next[4][2] = {
                {0, 1},
                {1, 0},
                {0, -1},
                {-1, 0}
        };
        int k, tx, ty;

        for (k = 0; k <= 3; ++k) {
                tx = x + next[k][0];
        }
}

void foo()
{
        printf("Hello, world...");
}

int main()
{
        int i, j, startx, starty;
        scanf("%d %d %d %d", &n, &m, &startx, &starty);

        for (i = 1; i <= n; ++i) {
                for (j = 1; j <= n; ++j) {
                        scanf("%d", &a[i][j]);
                }
        }
        dfs(startx, starty);

        foo();

}
