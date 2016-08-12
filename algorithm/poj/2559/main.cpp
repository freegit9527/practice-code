#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <stack>
#include <algorithm>

using namespace std;

typedef long long ll;
ll a[(int)1e5+10];
stack<int> st;

int main() {
#ifndef ONLINE_JUDGE
#endif
    freopen("input.txt", "r", stdin);

    int n;
    while (~scanf("%d", &n) && n) {
        for (int i = 0; i < n; ++i) scanf("%lld", a + i);
        st.push(0);
        ll ans = a[0];

        for (int i = 1; i < n; ++i) {
            while (!st.empty() && a[st.top()] > a[i]) {
                ans = max(ans, a[st.top()] * (i - st.top()));
                st.pop();
            }
            st.push(i);
        }
        if (!st.empty()) {
            int last = st.top();
            while (!st.empty()) {
                ans = max(ans, a[st.top()] * (last - st.top() + 1));
                st.pop();
            }
        }
        printf("%lld\n", ans);
    }

    return 0;
}
