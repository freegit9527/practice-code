/*
 * =====================================================================================
 *       Filename : AddOn2.cpp
 *    Description : return max abs of two childnode of a binary tree
 *    Version     : 0.1
 *        Created : 08/29/14 20:23
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <iostream>
#include <algorithm>                            /* include 'max' function */
using namespace std;
/* 
 * ===  FUNCTION  ======================================================================
 *         Name:  MaxAbs
 *  Description:  return max abs of two childnode of a binary tree
 * =====================================================================================
 */
int	
MaxAbs ( BinaryTreeNode *pNode )
{
	if (pNode == NULL) return 0;
	if (pNode->m_pLeft == NULL || pNode->m_pRight == NULL) return 0;
	int tmp = abs(pNode->m_pLeft->value - pNode->m_pRight->value);
	return max(tmp, MaxAbs(pNode->m_pLeft), MaxAbs(pNode->m_pRight));
}		/* -----  end of function MaxAbs  ----- */

