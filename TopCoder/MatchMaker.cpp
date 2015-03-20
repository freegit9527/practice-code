/*
 * =====================================================================================
 *       Filename : MatchMaker.cpp
 *    Description : MatchMaker
 *    Version     : 
 *        Created : 03/20/15 14:06
 *         Author : Liu Xue Yang (LXY), liuxueyang457@163.com
 *         Motto  : Suicide is Painless
 * =====================================================================================
 */
#include <sstream>
#include <iostream>
#include <cstdlib>
#include <string>
#include <utility>
#include <algorithm>
#include <vector>

using namespace std;


/*
 * =====================================================================================
 *        Class:  MatchMaker
 *  Description:  MatchMaker 
 * =====================================================================================
 */
class MatchMaker
{
	public:
		/* ====================  LIFECYCLE     ======================================= */
		vector<string> getBestMatches(
				vector<string> members,
				string currentUser,
				int sf
				)
		{
			string name, gender, want;
			vector<string> ques;
			for ( unsigned int i = 0; i < members.size(); ++i ) {
				istringstream is(members[i]);
				is >> name;
				if ( name != currentUser ) {
					continue;
				}
				is >> gender >> want;
				string x;

				while ( is >> x ) {
					ques.push_back(x);
				}
				break;
			}
			vector<pair<pair<int,int>, string> > ret;
//			cout << "name = "  << name << " gender = "  << gender << 
//				" want = " << want << endl;
			for ( unsigned int i = 0; i < members.size(); ++i ) {
				istringstream is2(members[i]);
				string name2, gender2, want2;
				is2 >> name2 >> gender2 >> want2;
				if ( name2 == currentUser || gender2 != want ) {
					continue;
				}
				vector<string> answer;
				string x;
				while ( is2 >> x ) {
					answer.push_back(x);
				}
				int same = 0;
				for ( size_t j = 0; j < answer.size(); ++j ) {
					if ( answer[j] == ques[j] ) {
						++same;
					}
				}
				if ( same >= sf ) {
					ret.push_back(make_pair(make_pair(-same, i), name2));
				}
			}
//			cout << "ret size: "  << ret.size() << endl;
			sort(ret.begin(), ret.end());
			vector<string> ans;

			for ( size_t i = 0; i < ret.size(); ++i ) {
				ans.push_back(ret[i].second);
			}
			return ans;
		}

}; /* -----  end of class MatchMaker  ----- */



	int
main ( int argc, char *argv[] )
{
	vector<string> answer;
	string members[] = {"BETTY F M A A C C",
 "TOM M F A D C A",
 "SUE F M D D D D",
 "ELLEN F M A A C A",
 "JOE M F A A C A",
 "ED M F A D D A",
 "SALLY F M C D A B",
 "MARGE F M A A C C"};
	vector<string> Members(members, members + 8);
	string currentUser = "MARGE";
	int sf = 4;
//	vector<string> answer;
	MatchMaker tmp;
	answer = tmp.getBestMatches(Members, currentUser, sf);

//	cout << "answer size: " << answer.size();
	for ( size_t i = 0; i < answer.size(); ++i ) {
		cout << " "  << answer[i];
	}
//	cout << "hello, world.." ;
	cout << endl;

		return EXIT_SUCCESS;
}				/* ----------  end of function main  ---------- */

