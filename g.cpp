#include <iostream>
#include <regex>
#include <string>

using namespace std;

int main() {
	string s, a;
	cin >> s;
	cin.ignore();
	auto rg = regex(s);

	while (getline(cin, a)) {
		if (regex_match(a, rg)) {
			cout << "YES" << endl;
		} else {
			cout << "NO" << endl;
		}
	}
}
