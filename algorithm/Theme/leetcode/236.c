/*
  236. Lowest Common Ancestor of a Binary Tree
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct TreeNode {
  int val;
  struct TreeNode *left;
  struct TreeNode *right;
} TreeNode;

struct TreeNode * lowestCommonAncestor(struct TreeNode * root,
                                       struct TreeNode * p,
                                       struct TreeNode * q) {
  if (NULL == root) { return NULL; }
  if (root == p || root == q) { return root; }
  TreeNode * left = lowestCommonAncestor(root->left, p, q);
  TreeNode * right = lowestCommonAncestor(root->right, p, q);
  if (left && right) { return root; }
  return left ? left : right;
}

TreeNode * insert(int value) {
  TreeNode * tmp = (TreeNode*)malloc(sizeof(TreeNode));
  tmp->val = value; tmp->left = tmp->right = NULL;
  return tmp;
}

int main(void) {
  TreeNode * root = insert(1);

  root->left = insert(2);
  root->right = insert(3);

  root->left->left = insert(4);
  root->left->right = insert(5);

  root->right->left = insert(6);
  root->right->right = insert(7);

  printf("%d\n", lowestCommonAncestor(root, root->left->left, root->right)->val);
}
