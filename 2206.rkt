#lang racket

(define (divide-array nums)
  (define expected-pairs (quotient (length nums) 2))
  (define sorted (list->vector (sort nums <)))
  (define n-len (length nums))
  (define (ref i)
    (vector-ref sorted i))
  (for/fold ([total 0]
             #:result (= expected-pairs total))
            ([i (in-range 0 n-len 2)]
             [j (in-range 1 n-len 2)]
             #:final (> total expected-pairs)
             #:break ((negate =) (ref i) (ref j)))
    (add1 total)))

(divide-array '[2 2 3 3])
(divide-array '[1 2 3 4])
