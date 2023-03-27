;; Sum all multiples of a and b up to n 
(lambda summultiples [x y n]
  (var total 0)
  (for [i 1 n]
    (if (or (= 0 (% i x))
	    (= 0 (% i y))
	)
	(set total (+ total i))
    )
  )
  total
)
(local a 3)
(local b 5)	
(local n 1000000)	
(print (summultiples a b n))	
