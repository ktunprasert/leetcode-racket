#lang racket

(define/contract (height-checker heights)
  (-> (listof exact-integer?) exact-integer?)
  (count (λ (a b) ((negate =) a b)) heights (sort heights <)))

(height-checker '(1 1 4 2 1 3))
