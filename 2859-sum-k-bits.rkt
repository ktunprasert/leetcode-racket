#lang racket

(define (bitcount n [count 0])
  (cond
    [(zero? n) count]
    [else (bitcount (bitwise-and n (sub1 n)) (add1 count))]))

(define (sum-indices-with-k-set-bits nums k)
  (for/sum ([(n i) (in-indexed nums)] #:when (= k (bitcount i))) n))

(sum-indices-with-k-set-bits (list 5 10 1 5 2) 1)
