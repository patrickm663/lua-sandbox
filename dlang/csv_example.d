import std.csv;
import std.file;
import std.array;
import std.stdio;
import std.string;
import std.algorithm;
import std.conv;

float[][] read_csv(string filename) {
  auto file_data = readText(filename);
  auto csv_data = file_data.chomp.splitter('\n').map!(a => a.splitter(',').array).array;
  float[][] data_float = csv_data.map!(a => a.map!(b => b.canFind('.') ? b.to!float : b == "good" ? 1.0f : 0.0f).array).array;
  return data_float;
}

void main() {
  // Define the input data
  float[][] data = read_csv("wine.csv");

  // Print the data to the console
  foreach (row; data) {
    writeln(row);
  }
}

