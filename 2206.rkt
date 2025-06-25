#lang racket

(define (divide-array nums)
  (define expected-pairs (quotient (length nums) 2))
  (define sorted (list->vector (sort nums <)))

  (define (ref i)
    (vector-ref sorted i))

  (= expected-pairs
     (for/sum ([i (in-range 0 (length nums) 2)] [j (in-range 1 (length nums) 2)]
                                                #:break ((negate =) (ref i) (ref j)))
              1)))

(divide-array '[2 2 3 3])
(divide-array '[1 2 3 4])
