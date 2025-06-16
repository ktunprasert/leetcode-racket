#lang racket

(define (sum-of-multiples n)
  (for/sum ([n (inclusive-range 0 n)])
           (cond
             [(zero? (modulo n 3)) n]
             [(zero? (modulo n 5)) n]
             [(zero? (modulo n 7)) n]
             [else 0])))

(sum-of-multiples 7)
(sum-of-multiples 10)
