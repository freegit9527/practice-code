#include <std/c++.h>

using namespace std;

const int N = 1200300;

int n;
pair<pti, int> a[N];

bool read() {
	if (!(cin >> n)) return false;
	forn(i, n) assert(scanf("%d%d", &a[i].x.x, &a[i].x.y) == 2), a[i].y = i;
	return true;
}

int t[N];
vector<int> ys;

inline void inc(int i, int val) {
	for ( ; i < sz(ys); i |= i + 1)
		t[i] += val;
}

inline int sum(int i) {
	int ans = 0;
	for ( ; i >= 0; i = (i & (i + 1)) - 1)
		ans += t[i];
	return ans;
}

int ans[N];

void solve() {
	ys.clear();
	forn(i, n) ys.pb(a[i].x.y);
	sort(all(ys));
	ys.erase(unique(all(ys)), ys.end());
	forn(i, sz(ys)) t[i] = 0;

	sort(a, a + n);
	nfor(i, n) {
		int idx = int(lower_bound(all(ys), a[i].x.y) - ys.begin());
		ans[a[i].y] = sum(idx);
		inc(idx, +1);
	}

	forn(i, n) printf("%dn", ans[i]);
}
