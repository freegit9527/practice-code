/*
 * =====================================================================================
 *       Filename : list.c
 *        Created : 10/21/14 16:12
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
	int n;
	struct Node *next;
}Node;

typedef Node * pNode;

/*
 * argument n is the number of nodes to create
 */
Node * create(int n) {
	pNode Head, p_tmp, q;
	int tmp;
	Head = (Node*)malloc(sizeof(Node));
	Head->n = -1;
	Head->next = NULL;
	q = Head;
	while (n--) {
		scanf ( "%d", &tmp );
		p_tmp = (Node*)malloc(sizeof(Node));
		p_tmp->n = tmp;
		p_tmp->next = NULL;
		q->next = p_tmp;
		q = p_tmp;
	}
	return Head;
}

/*
 * pos starts from position 0
 * n is the value 
 */
int delete(Node *h, int pos)
{
	Node* p;
	Node* n_p;
	p = h;
	while (pos--) {
		if (!p) {
			printf ( "pos out of range!\n" );
			return -1;
		}
		p = p->next;
	}
	if (!p->next) {
		printf ( "pos out of range!\n" );
		return -1;
	}
	n_p = p->next;
	p->next = n_p->next;
	free(n_p);
	n_p = NULL;
	return 1;
}

/*
 * pos starts from position 0
 * insert a node at position pos
 * is the value to insert
 * pos is allowed to be set 0 to len (len is the length of list which 
 * represents the next position of the last element of the list)
 */
int insert(Node *h, int n, int pos)
{
	Node* p;
	Node* n_p;
	p = h;
	while (pos--) {
		if (!p->next) {
			printf ( "pos out of range!\n" );
			return -1;
		}
		p = p->next;
	}
	n_p = (Node*)malloc(sizeof(Node));
	n_p->n = n;
	n_p->next = p->next;
	p->next = n_p;
	return 0;
}

void print(Node *h)
{
	Node *p = h;
	if (!h->next) {
		printf ( "empty list!\n" );
		return;
	}
	p = h->next;
	while (p) {
		printf ( "%d\t", p->n );
		p = p->next;
	}
	printf ( "\n" );
	return;
}

/*
 * reverse list
 */
void reverse(Node **h)
{
	pNode s = *h, p, q;
	s = s->next;
	if (!s) {
		printf ( "empty list!\n" );
		return;
	}
	if (!s->next) {
		printf ( "Only one node.\n" );
		return;
	}
	p = s->next;
	s->next = NULL;
	while ( p ) {
		q = p->next;
		p->next = s;
		s = p;
		p = q;
	}
	(*h)->next = s;
	return;
}

	int
main ( int argc, char *argv[] )
{
	int n;
	int pos;
	int value;
	pNode Head;
	printf ( "number of values to insert:\n" );
	scanf ( "%d", &n );
	Head = create(n);

	printf ( "Print the list:\n" );
	print(Head);

	printf ( "Reverse the list:\n" );
	reverse(&Head);

	printf ( "Print the list:\n" );
	print(Head);

	printf ( "Insert pos and value:\n" );
	scanf ( "%d%d", &pos, &value ); 
	insert(Head,value, pos);

	printf ( "Print the list:\n" );
	print(Head);

	printf ( "position to delete:\n" );
	scanf ( "%d", &pos );
	delete(Head, pos);

	printf ( "Print the list:\n" );
	print(Head);
		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
