#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int ROW = 1000 + 1;
const int COLUMN = 1000 + 1;
int rec[ROW][COLUMN];
int points[1000*1000+1];
int point_count;
int already_visit = 0;

void dfs(int start) {
  points[start] = 1;
  already_visit++;
  printf("%d ", start);
  
  if (already_visit == point_count) {
    return;
  }
  /*
  for (int i = 1; i <= COLUMN; ++i) {
    if (rec[start][i] && points[i] == 0) {
      dfs(i);
    }
  }
  // this also works :)
  */
  for (int i = 1; i <= point_count; ++i) {
    if (rec[start][i] && points[i] == 0) {
      dfs(i);
    }
  }
}

int main(void)
{
  freopen("dfs.txt", "r", stdin);
  int edges, row, column;

  already_visit = 0;
  scanf("%d %d", &point_count, &edges);
  memset(rec, 0, sizeof(rec));
  memset(points, 0, sizeof(points));

  for (int i = 1; i <= edges; ++i) {
    scanf("%d %d", &row, &column);
    rec[row][column] = 1;
    rec[column][row] = 1;
  }

  dfs(1);
  
  return 0;
}
