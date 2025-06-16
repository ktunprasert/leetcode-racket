#lang racket

(define (sum-of-multiples n)
  (for/sum ([n (inclusive-range 0 n)]
            #:when (or (zero? (modulo n 3)) (zero? (modulo n 5)) (zero? (modulo n 7))))
           n))

(sum-of-multiples 7)
(sum-of-multiples 10)
