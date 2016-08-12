/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  http://www.nowcoder.com/practice/60231d6931d543d4aadcb67851b21e4a?rp=4&ru=/activity/oj&qru=/ta/cracking-the-coding-interview/question-ranking
 *
 *        Version:  1.0
 *        Created:  08/12/2016 08:45:40
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#include <iostream>
#include <cstdio>

using namespace std;

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
    TreeNode(int x) :
            val(x), left(NULL), right(NULL) {
    }
};

class Successor {
public:
  Successor()
    : findPoint(false), nextFound(false), nextNum(-2) {}
  int findSucc(TreeNode* root, int p) {
      // write code here
      if (nextFound) return nextNum;
      if (!root) return -1;

      int left, right;
      left = findSucc(root->left, p);

      if (left != -1) return left;

      if (findPoint) {
        findPoint = false;
        nextNum = root->val;
        nextFound = true;
        return root->val;
      }

      if (root->val == p) {
        findPoint = true;
      }

      right = findSucc(root->right, p);
      return right;
  }
  bool findPoint, nextFound;
  int nextNum;
};

int main(void) {
  TreeNode root = TreeNode(1), left = TreeNode(2), right = TreeNode(3);

  int result;

  root.left = &left;
  root.right= &right;

  printf("Case 1: ");
  Successor s;
  result = s.findSucc(&root, 1);
  printf("result = %d\n", result);

  printf("Case 2: ");
  Successor s1;
  result = s1.findSucc(&root, 2);
  printf("result = %d\n", result);

  printf("Case 3: ");
  Successor s2;
  result = s2.findSucc(&root, 3);
  printf("result = %d\n", result);

  return 0;
}
