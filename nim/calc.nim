import strutils
import math

echo "f(x) = log(x)*x^2 + x^3"
echo "Enter a postive number: "
var i: float = stdin.readLine().parseFloat()

proc f(x: float): float =
  doassert x > 0.0
  return ln(x)*x^2 + x^3

echo f(i)
