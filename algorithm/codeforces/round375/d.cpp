// http://codeforces.com/contest/723/problem/D

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <algorithm>

using namespace std;

char a[55][55];
bool b[55][55];
int n,m;
struct node{
    int x,y;
    int num;
};
node lake[50*50+50];
bool comp(node x, node y){ return x.num <y.num;}
bool border(int i,int j){ return i==0||j==0||i==n-1||j==m-1;}
int dfs(int i,int j){
    int left,right,up,down;
    left=right=up=down=0;
    if(a[i][j]=='*')return 0; // bug. if a[i][j]=='.' and b[i][j] is ture.
    if(b[i][j]){
        if(border(i,j))return -50000;
        else return 0;
    }
    b[i][j]=true;
    if(border(i,j)) return -50000;
    if(i>0) up=dfs(i-1,j);
    if(j>0) left=dfs(i,j-1);
    if(i<n-1) down=dfs(i+1,j);
    if(j<m-1) right=dfs(i,j+1);
    int res=up+left+down+right+1;

    return res;
}
void fill_dfs(int i,int j){
    if(a[i][j]=='*')return;
    a[i][j]='*';
    if(i>=2) fill_dfs(i-1,j);
    if(j>=2) fill_dfs(i,j-1);
    if(i<=n-3) fill_dfs(i+1,j);
    if(j<=m-3) fill_dfs(i,j+1);
}
int main()
{
    #ifndef ONLINE_JUDGE
    freopen("d_in.txt","r",stdin);
    //    freopen("d_out.txt","w",stdout);
    #endif // ONLINE_JUDGE

    int k;
    while (cin>>n>>m>>k){
        for(int i=0;i<n;++i)
            for(int j=0;j<m;++j)
            b[i][j]=false;
        for(int i=0;i<50*50+50;++i)
        {
            lake[i].num=lake[i].x=lake[i].y=0;
        }
        for(int i=0;i<n;i++){
            cin>>a[i];
        }

        int N=0;
        for(int i=0;i<n;++i){
            for(int j=0;j<m;++j){
                if(!b[i][j]&&a[i][j]=='.'){
                    lake[N].num=dfs(i,j);
                    if(lake[N].num>0){
                        lake[N].x=i;
                        lake[N].y=j;
                        N++;
                    }
                }
            }
        }

        sort(lake,lake+N,comp);
        int cnt=0;

        for(int i=0;i<N-k;++i){
            fill_dfs(lake[i].x,lake[i].y);
            cnt+=lake[i].num;
        }
        cout<<cnt<<endl;
        for(int i=0;i<n;++i)
            cout<<a[i]<<endl;
    }

    return 0;
}
