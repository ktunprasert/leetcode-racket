#lang racket

(define (count-k-difference nums k)
  (for/sum ([(n1 i) (in-indexed nums)])
           (for/sum ([n2 (drop nums (add1 i))] #:when (= k (abs (- n1 n2)))) 1)))

(count-k-difference (list 1 2 2 1) 1)
