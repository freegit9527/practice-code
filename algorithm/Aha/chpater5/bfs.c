/*
 * =====================================================================================
 *       Filename : bfs_1.c
 *    Description : 
 *    Version     : 
 *        Created : 03/12/16 07:08
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int ROW = 1000 + 1;
const int COLUMN = 1000 + 1;
int rec[ROW][COLUMN];
int point_count;
int bfs_queue[1000 * 1000 + 1];
int already_visit[1000 * 1000 + 1];

void bfs(int start) {
  int head = 1, tail = 1;

  bfs_queue[head] = start;
  already_visit[start] = 1;
  ++tail;

  while(head < tail) {
    printf("%d ", bfs_queue[head]);

    for(int i = 1; i <= point_count; ++i) {
      if (rec[i][bfs_queue[head]] == 1 &&
          already_visit[i] == 0) {
        bfs_queue[tail] = i;
        // mark the point visited HERE! NOT before
        // the for loop :(
        already_visit[i] = 1;
        ++tail;
      }
    }
    
    ++head;
  }
}

int main(void)
{
  freopen("bfs.txt", "r", stdin);
  
  int edges_count, row, column;
  
  scanf("%d %d", &point_count, &edges_count);
  memset(rec, 0, sizeof(rec));
  memset(bfs_queue, 0, sizeof(bfs_queue));
  memset(already_visit, 0, sizeof(already_visit));

  for (int i = 1; i <= edges_count; ++i) {
    scanf("%d %d", &row, &column);
    rec[row][column] = 1;
    rec[column][row] = 1;
  }

  bfs(1);
  
  return 0;
}

