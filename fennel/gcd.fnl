;; Print the greatest common divisor (GCD) of two positive integers a and b
(fn gcd [a b]
  (if (= 0 b)
      a
    (gcd b (% a b))))
(print (gcd 462 1071))
