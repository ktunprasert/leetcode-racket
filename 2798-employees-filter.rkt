#lang racket

(define/contract (number-of-employees-who-met-target hours target)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (for/fold ([count 0])
            ([h (in-list hours)]
             #:when (>= h target))
    (add1 count)))


(number-of-employees-who-met-target '(40 50 60 70 80) 60)
