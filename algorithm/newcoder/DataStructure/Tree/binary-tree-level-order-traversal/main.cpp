/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.nowcoder.com/practice/04a5560e43e24e9db4595865dc9c63a3?rp=2&ru=/activity/oj&qru=/ta/leetcode/question-ranking
 *
 *        Version:  1.0
 *        Created:  08/12/2016 14:09:51
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  liuxueyang 
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

/**
* Definition for binary tree
*/
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution {
public:
  Solution()
    :level(0) {}
  vector<vector<int> > levelOrder(TreeNode *root) {
    if (!root) return result;
    if ((int)result.size() < (level + 1)) {
      vector<int> tmp;
      result.push_back(tmp);
    }
    result[level].push_back(root->val);
    ++level;
    levelOrder(root->left);
    levelOrder(root->right);
    --level;
    return result;
  }

  int level;
  vector<vector<int> > result;
};

int main(void) {
  TreeNode root = TreeNode(3), left = TreeNode(9), right = TreeNode(20),
           rightleft = TreeNode(15), rightright = TreeNode(7);

  root.left = &left;
  root.right= &right;
  root.right->left = &rightleft;
  root.right->right = &rightright;

  Solution solu;

  vector<vector<int> > res = solu.levelOrder(&root);
  int sz = (int)res.size();
  for (int i = 0; i < sz; ++i) {
    int zz = (int)res[i].size();
    printf("[");
    for (int j = 0; j < zz; ++j) {
      printf("%d", res[i][j]);
      if (j + 1 != zz) {
        printf(", ");
      }
    }
    printf("]");
    if (i + 1 != sz) {
      printf(",");
    }
    printf("\n");
  }

  return 0;
}
