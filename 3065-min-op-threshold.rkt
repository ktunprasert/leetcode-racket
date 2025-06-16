#lang racket

(define/contract (min-operations nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (count (curryr < k) nums))

(min-operations '(2 10 11 1 3) 10)
(min-operations '(1 1 2 4 9) 1)
