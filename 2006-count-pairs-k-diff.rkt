#lang racket

(define (count-k-difference nums k)
  (for/sum ([(n1 i) (in-indexed nums)])
           (for/sum ([n2 (drop nums (add1 i))]) (if (= k (abs (- n2 n1))) 1 0))))

(count-k-difference (list 1 2 2 1) 1)
