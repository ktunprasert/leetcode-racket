#lang racket

(define/contract (find-numbers nums)
  (-> (listof exact-integer?) exact-integer?)
  (count (λ (n) (even? (add1 (floor (log n 10))))) nums))

(find-numbers '[12 345 2 6 7896])
(find-numbers '[300])
