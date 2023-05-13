import strutils

echo "Colatz Conjecture"
echo "Please provide a number"
var i: int = readLine(stdin).parseInt()

proc colatzChainLength(m: int): int = 
  var colatz_len: int = 0
  var n: int = m
  while n > 1: 
    if n mod 2 == 0:
      n = int(n/2)
    else:
      n = 3*n + 1
    colatz_len += 1
  return colatz_len

proc longestColatzChain(n: int): array[2, int] =
  var m_chain: int = 0
  var v_chain: int = 0
  var c_chain: int = 0
  for k in 1 .. n:
    c_chain = colatzChainLength(k)
    if c_chain > m_chain:
      m_chain = c_chain
      v_chain = k
  return [m_chain, v_chain]

let cc: array[2, int] = longestColatzChain(i)
echo "Longest Colatz chain length: ", cc[0]
echo "Corresponding value: ", cc[1]

