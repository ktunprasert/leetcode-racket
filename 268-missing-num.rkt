#lang racket

(define/contract (missing-number nums)
  (-> (listof exact-integer?) exact-integer?)
  (+ (length nums) (for/sum ([(n i) (in-indexed nums)]) (- i n))))

(missing-number '(0 2 3))
