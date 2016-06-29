#include <stdio.h>
#include <stdlib.h>

// Find lowest common ancestor in binary tree. We assume the
// values in the tree are unique and the two values are always in
// the tree.

// Time complexity O(n)
// Space complexity O(n)

typedef struct Node
{
  int key;
  struct Node *left, *right;
} Node;

Node* createNode(int key)
{
  Node * tmp = (Node*)malloc(sizeof(Node));
  tmp->key = key;
  tmp->left = tmp->right = NULL;
  return tmp;
}

Node* findLCA(Node* root, int n1, int n2) {
  if (root == NULL) { return NULL; }
  if (n1 == root->key || n2 == root->key) { return root; }
  Node* left = findLCA(root->left, n1, n2);
  Node* right = findLCA(root->right, n1, n2);
  if (left && right) { return root; }
  return left ? left : right;
}

int main()
{
  Node* root = createNode(1);

  root->left = createNode(2);
  root->right = createNode(3);

  root->left->left = createNode(4);
  root->left->right = createNode(5);

  root->right->left = createNode(6);
  root->right->right = createNode(7);

  printf("LCA(4, 5) = %d\n", findLCA(root, 4, 5)->key);
  printf("LCA(4, 6) = %d\n", findLCA(root, 4, 6)->key);
  printf("LCA(3, 4) = %d\n", findLCA(root, 3, 4)->key);
  printf("LCA(2, 4) = %d\n", findLCA(root, 2, 4)->key);

  return 0;
}
