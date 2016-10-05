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

int main ( void )
{
        _
#ifndef  ONLINE_JUDGE
                freopen("a_in.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

        int n;
        char a[120];

        while (cin>>n>>a) {
                int b[120];
                memset(b, 0, sizeof(b));
                int tmp=0, j = 0;
                for (auto i = 0; i < n; ++i) {
                        if('B'==a[i]){
                                tmp++;
                        }
                        else {
//                                cout <<"tmp="<<tmp  << "\n";
                                b[j]=tmp;
                                if (tmp) {
	                                j++;                                        
                                }
                                tmp=0;
                        }
                }
                if ('B'==a[n-1]) {
                        b[j]=tmp;
                        j++;                        
                }
                cout<<j<<endl;
                for (auto i = 0; i < j; ++i) {
                        cout <<b[i]  << " ";
                }
                cout <<  "\n";


        }

        return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
