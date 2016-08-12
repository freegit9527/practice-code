#include<cstring>
#include<algorithm>
#include<vector>
#include<string>
#include<iostream>
#include<queue>
#include<cmath>
#include<map>
#include<stack>
#include<bitset>
using namespace std;
#define REPF( i , a , b ) for ( int i = a ; i <= b ; ++ i )
#define REP( i , n ) for ( int i = 0 ; i < n ; ++ i )
#define CLEAR( a , x ) memset ( a , x , sizeof a )
typedef long long LL;
typedef pair<int,int>pil;
const int INF = 0x3f3f3f3f;
const int maxn=1e5+100;
struct node{
    int val;
    int pos;
};
stack<node>s;
int n,a[maxn];
int main()
{
    node st;
    while(~scanf("%d",&n)&&n)
    {
        REPF(i,1,n)
          scanf("%d",&a[i]);
        st.val=st.pos=0;
        s.push(st);LL ans=0;
        for(int i=1;i<=n;i++)
        {
            st.pos=i;
            while(s.top().val>a[i])
            {
                st=s.top();
                s.pop();
                LL temp=(LL)st.val*(i-st.pos);
                ans=max(ans,temp);
            }
            st.val=a[i];
            s.push(st);
        }
        while(!s.empty())
        {
            st=s.top();
            LL temp=(LL)st.val*(n-st.pos+1);
            printf("pos = %d, val = %d, tmp = %lld\n", st.pos, st.val, temp);
            ans=max(ans,temp);
            s.pop();
        }
        printf("%lld\n",ans);
    }
    return 0;
}
