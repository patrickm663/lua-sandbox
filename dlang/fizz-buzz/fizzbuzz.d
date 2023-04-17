import std.algorithm;
import std.stdio;
import std.conv;
import std.algorithm.iteration;
import std.array;
import std.range;
import std.string;

void main() {
    "Enter the size of the Fizz-Buzz array: ".writeln;
    int len = readln().strip.to!int;
    assert(len > 0, "The size must be positive");
    "Enter the multiple for 'Fizz': ".writeln;
    int multiple1 = readln().strip.to!int;
    assert(multiple1 > 0, "'Fizz' must be positive");
    "Enter the multiple for 'Buzz': ".writeln;
    int multiple2 = readln().strip.to!int;
    assert(multiple2 > 0, "'Buzz' must be positive");
    string[] result = fizzbuzz(len, multiple1, multiple2);
    result.writeln;
}

string[] fizzbuzz(int n, int a, int b) {
// Input: an int of size n, an int a and b representing the multiples that "Fizz" and "Buzz" will be assigned to
// Output: an array of size n where each multiple of 3 is replaced with "Fizz", b is replaced with "Buzz", and a*b is replaced with "FizzBuzz
  int[] data = iota(1, n+1).array;
  string[] fb = data
    .map!(i => 
      i % (a*b) == 0 ? "FizzBuzz" 
      : i % a == 0 ? "Fizz" 
      : i % b == 0 ? "Buzz" 
      : i.to!string
      )().array;
  return(fb);
}
