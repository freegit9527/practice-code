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
                freopen("b_in.txt", "r", stdin);
#endif     /* -----  ONLINE_JUDGE  ----- */

        char pa[120][120];
        int n,k;
        while (cin>>n>>k) {
                for (auto i = 0; i < n; ++i) {
                        cin>>pa[i];
                }
                char cor[120];
                cin>>cor;
                int best=0,worst=0,len=strlen(cor);
                int lenpa[120];
                for (auto i = 0; i < n; ++i) {
                        lenpa[i]=strlen(pa[i]);
                }
                sort(lenpa,lenpa+n);

                int cnt=upper_bound(lenpa,lenpa+n,len)-
                        lower_bound(lenpa,lenpa+n,len);

                worst=upper_bound(lenpa,lenpa+n,len-1)-lenpa+cnt-1;
                worst=worst+(worst/k)*5+1;

                best=upper_bound(lenpa,lenpa+n,len-1)-lenpa;
                best=best+(best/k)*5+1;

                cout <<best<<" "<<worst  << "\n";

        }

        return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */
