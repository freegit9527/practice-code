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
    :level(1), result(0) {}
  int maxDepth(TreeNode *root) {
    if (!root) return result;
    result = result > level ? result : level;
    ++level;
    maxDepth(root->left);
    maxDepth(root->right);
    --level;
    return result;
  }
  int level, result;
};

int main(void) {
  TreeNode root = TreeNode(3), left = TreeNode(9), right = TreeNode(20),
           rightleft = TreeNode(15), rightright = TreeNode(7);

  root.left = &left;
  root.right= &right;
  root.right->left = &rightleft;
  root.right->right = &rightright;

  Solution solu;
  printf("%d\n", solu.maxDepth(&root));

  return 0;
}
