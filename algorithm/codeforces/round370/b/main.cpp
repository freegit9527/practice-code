/*
 * =====================================================================================
 *
 *       Filename:  main.cpp
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  09/12/2016 08:31:49
 *       Compiler:  g++
 *
 *         Author:  Sabastian (liuxueyang.github.io), read3valprintloop@gmail.com
 *
 * =====================================================================================
 */
#include <bits/stdc++.h>
using namespace std;
#define _ ios_base::sync_with_stdio(0);cin.tie(0);
#define rep(i, a, n) for (int i = a; i < n; ++i)
#define per(i, a, n) for (int i = n-1; i >= a; --i)
#define pb push_back
#define mp make_pair
#define all(x) (x).begin(),(x).end()
#define fi first
#define se second
#define SZ(x) ((int)(x).size())
typedef vector<int> VI;
typedef map<int,int> MI;
typedef long long ll;
typedef pair<int,int> PII;
const ll MOD=1000000007;
const int N = int(1e5+10);
char str[N];

int main ( void )
{
//  _
#ifndef  ONLINE_JUDGE
    freopen("input.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */


  while(~scanf("%s",str)){
    int x=0,y=0,len=strlen(str);
    rep(i,0,len){
      if('L'==str[i])x--;
      else if('R'==str[i])x++;
      else if('U'==str[i])y++;
      else y--;
    }
    int S=abs(x)+abs(y);
    if(0==x&&0==y)printf("0");
    else if(S&1)printf("-1");
    else printf("%d",S/2);
    printf("\n");
  }
  return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

