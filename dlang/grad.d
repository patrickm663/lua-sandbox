import std.stdio;
import std.math;

void main() {
  // Gradient descent
  float y(float x) {
    return pow(x, 2);
  }
  float loss(float x, float yt) {
    return pow(yt - y(x), 2);
  }
  float grad(float x, float yt) {
    return (loss(x + 0.000001, yt) - loss(x - 0.000001, yt))/(0.000002); 
  }

  float x = 50.0;
  float yt = 0.0;
  float lr = 0.0001;

  for(int i = 0; i < 1000001; i++) {
    x -= lr*pow(i, 3)*grad(x, yt);
    if(i >= 999995) {
      writeln(i, ": Loss: ", loss(x, yt));
    }
  }
  writeln("x: ", x);
}

