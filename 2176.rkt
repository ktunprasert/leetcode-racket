#lang racket

(define (count-pairs nums k)
  (for*/sum ([(n1 i) (in-indexed nums)] [(n2 j) (in-indexed (drop nums (+ 1 i)))] #:when (= n1 n2))
            (if (zero? (modulo (* i (+ i j 1)) k)) 1 0)))

(count-pairs (list 3 1 2 2 2 1 3) 2)
;; (count-pairs (list 1 2 3 4) 1)
