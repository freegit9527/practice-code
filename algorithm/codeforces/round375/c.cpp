// http://codeforces.com/contest/723/problem/C

#include <iostream>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <algorithm>

using namespace std;

int a[2010], b[2010];

int main()
{
#ifndef ONLINE_JUDGE
  freopen("c_in.txt","r",stdin);
#endif // ONLINE_JUDGE
  int n, m;
  
  while (cin>>n>>m) {
    memset(b,0,sizeof(b));
    for(int i=1;i<=n;++i) {
      cin>>a[i];
      if(a[i]<=m) b[a[i]]++;
    }
    int ave=n/m,changes=0;
    bool ma=true;
    //replace >m
    for(int i=1;i<=m;++i){
      if(b[i]<ave){
        for(int j=1;j<=n;++j){
          if(a[j]>m&&b[i]<ave){ // notice b[i]<ave
            a[j]=i;
            b[i]++;
            changes++;
          }
        }
      }
      if(b[i]<ave) ma=false;
    }
    if(!ma){
      // replace <=m
      for(int i=1;i<=m;++i){
        if(b[i]<ave){
          for(int j=1;j<=n;++j){
            if(a[j]<=m&&b[a[j]]>ave&&b[i]<ave){
              b[a[j]]--;
              b[i]++;
              a[j]=i;
              changes++;
            }
          }
        }
      }
    }
    int val=2010;
    for(int i=1;i<=m;++i){
      val=min(val,b[i]);
    }
    //not ave
    cout<<val<<' '<<changes<<endl;
    for(int i=1;i<=n;++i){
      cout<<a[i]<<' ';
    }
    cout<<endl;
  }

  return 0;
}
