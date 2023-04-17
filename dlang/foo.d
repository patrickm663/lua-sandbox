import std.algorithm;
import std.range;
import std.stdio;

void main() {
  int[] data = iota(1, 1000).array;
  int mapped = data
    .filter!(a => (a % 3 == 0 || a % 5 == 0))
    .reduce!((a, b) => a + b);
  mapped.writeln;
}

