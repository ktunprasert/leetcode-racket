#lang racket

(define (bitcount n [count 0])
  (cond
    [(zero? n) count]
    [else (bitcount (bitwise-and n (sub1 n)) (add1 count))]))

(define (min-operations nums k)
  (for/fold ([acc k]
             #:result (bitcount acc))
            ([n nums]
             #:when (> n 0))
    (bitwise-xor acc n)))

(min-operations (list 1 2 3 4 1 2 3) 1)
