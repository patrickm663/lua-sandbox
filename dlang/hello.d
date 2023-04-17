import std.stdio;
import std.conv;
import std.string;
import std.algorithm;
import std.array;

void main(){
	writeln("Enter a number: ");
	int n;
	n = readln().strip.to!int;
	int a = 3;
	int b = 5;
	fizzbuzz(n, a, b).writeln;
	string[] word_list = ["laptop", "phone", "charger"];
	starborder(word_list);
	int[] f = [0, 1, 1, 0, 4];
	xbonacci(f, n).writeln;
	int[] boxes = [1, 1, 5, 4, 3];
	gravityswitch(boxes, "L").writeln;
}

string[] fizzbuzz(int n, int a, int b){
	string[] arr;
	for(int i=1; i<=n; i++){
		if(i%a==0 && i%b==0){
			arr ~= "FizzBuzz";
		}else if(i%a==0){
			arr ~= "Fizz";
		}else if(i%b==0){
			arr ~= "Buzz";
		}else{
			arr ~= i.to!string;
		}
	}
	return(arr);
}

void starborder(string[] words){
	int max_star_length = 4 + words.map!(a => a.length).maxElement().to!int;
	replicate("*", max_star_length).writeln;
	for(int i=0; i<words.length; i++){
		ulong gap = max_star_length - words[i].length - 3;
		writeln("* ", words[i], replicate(" ", gap), "*");
	}
	replicate("*", max_star_length).writeln;
}

int[] gravityswitch(int[] arr, string dir){
	if(dir == "L"){
		arr.sort.reverse;
	} else if(dir == "R"){ 
		arr.sort;
	}
	return(arr);
}

int[] xbonacci(int[] fibb, int n){
	int s = fibb.length.to!int;
	if(n < s) return(fibb[0..n]);
	for(int i=0; i<(n-s); i++){
		fibb ~= reduce!((a, b) => a+b)(fibb[i..(i+s)]); 
	}
	return(fibb);
} 
