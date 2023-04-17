import std.algorithm;
import std.range;
import std.stdio;

void main() {
  // Sums the multiples of 3 or 5 up to 1000
  int[] data = iota(1, 1000).array;
  int mapped = data
    .filter!(a => (a % 3 == 0 || a % 5 == 0))
    .reduce!((a, b) => a +b);
  mapped.writeln;
}

