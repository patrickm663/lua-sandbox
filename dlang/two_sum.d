import std.stdio;
import std.array;
import std.range;
import std.string;

void main(){
  int[] a = array(iota(-10, 10));
	int[] b = array(iota(-20, 20));
	int m = 1;
	//two_sum(a, b, m);
}

void two_sum(int[] a, int[] b, int m) {
  bool found = false;
  foreach(i; a){
    foreach(j; b){
      if(i + j == m) {
				found = true;
        writeln(i, " + ", j, " = ", m);
			}
    } 
	}
	if(found == false) return writeln("Could not find values that sum to ", m);
}

string longest_substring(string s) {
  string l = '';
	foreach(c; s){
    l += c;
		if() {

		}
	}

}

