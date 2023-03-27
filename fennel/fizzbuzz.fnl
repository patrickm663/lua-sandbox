;; Fizz-Buzz programme
(local a 3)
(local b 5)	
(local c (* 3 5))	
(for [i 1 20]
  (if (= 0 (% i c))
      (print "fizzbuzz")
      (= 0 (% i a))
      (print "fizz")
      (= 0 (% i b))
      (print "buzz")
      (print i)))
