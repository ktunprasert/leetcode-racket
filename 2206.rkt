#lang racket

(define (divide-array nums)
  (define expected-pairs (quotient (length nums) 2))
  (define sorted (list->vector (sort nums <)))
  (define n-len (length nums))
  (define (ref i)
    (vector-ref sorted i))
  (= expected-pairs (count (λ (i j) (= (ref i) (ref j))) (range 0 n-len 2) (range 1 n-len 2))))

(divide-array '[2 2 3 3])
(divide-array '[1 2 3 4])
