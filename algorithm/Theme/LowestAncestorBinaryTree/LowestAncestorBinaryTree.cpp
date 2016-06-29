#include <stdio.h>
#include <stdlib.h>

struct Node
{
  int key;
  struct Node *left, *right;
};
// in c++, it does not need typedef;

Node* createNode(int key)
{
  Node * tmp = (Node*)malloc(sizeof(Node));
  tmp->key = key;
  tmp->left = tmp->right = NULL;
  return tmp;
}



int main()
{
  
  return 0;
}
