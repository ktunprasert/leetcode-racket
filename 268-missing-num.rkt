#lang racket

(define/contract (missing-number nums)
  (-> (listof exact-integer?) exact-integer?)
  (define hnums
    (for/hash ([n nums])
      (values n #t)))

  (for/first ([i (in-inclusive-range 0 (add1 (apply max nums)))]
              #:unless (hash-has-key? hnums i))
    i))

(missing-number '(0 2 3))
