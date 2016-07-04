#include <algorithm>
#include <iostream>
#include <map>
#include <set>

using namespace std;

const int MAX_N = 100 * 10000 + 1;
int a[MAX_N], n;
set<int> idea;
map<int, int> num_idea;

void solve() {
  idea.clear();
  num_idea.clear();

  for (int i = 0; i < n; ++i) {
    idea.insert(a[i]);
  }

  int all_ideas = (int)idea.size();
  int s = 0, t = 0, cnt = 0, ans = n + 1;

  while (true) {
    while (t < n && cnt < all_ideas) {
      if (num_idea[a[t]] == 0) {
        cnt++;
      }
      num_idea[a[t]]++;
      ++t;
    }
    if (cnt < all_ideas) {
      break;
    }
    ans = min(ans, t - s);
    num_idea[a[s]]--;
    if (num_idea[a[s]] == 0) {
      num_idea.erase(a[s]);
      --cnt; // REMEMBER THIS. CAUSE WE USE IT IN NEXT LOOP
    }
    ++s;
  }

  printf("%d\n", ans);

  return;
}

int main(void) {
#ifndef ONLINE_JUDGE
  freopen("3320.txt", "r", stdin);
#endif
  scanf("%d", &n);
  for (int i = 0; i < n; ++i) {
    scanf("%d", a + i);
  }
  solve();

  return 0;
}
