;; Returns n!
(local N 10)
(fn factorial [n]
  (if (= n 0)
      1
  (* n (factorial (- n 1)))))
(print (factorial N))
