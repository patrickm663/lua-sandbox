;; Fizz-Buzz programme
(lambda fizzbuzz [x y n]
  (local z (* x y))
  (for [i 1 n]
    (if (= 0 (% i z))
	(print "fizzbuzz")
	(= 0 (% i x))
	(print "fizz")
	(= 0 (% i y))
	(print "buzz")
	(print i)
    )
  )
)
(local a 3)
(local b 5)	
(local n 30)	
(fizzbuzz a b n)	
