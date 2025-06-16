#lang racket

(define (bitcount n [count 0])
  (cond
    [(zero? n) count]
    [else (bitcount (bitwise-and n (sub1 n)) (add1 count))]))

(define (min-operations nums k)
  (for/fold ([target k]
             #:result (bitcount target))
            ([lst (group-by identity nums)]
             #:when (odd? (length lst)))
    (bitwise-xor target (first lst))))

(min-operations (list 1 2 3 4 1 2 3) 1)
