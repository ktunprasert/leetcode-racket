#lang racket

(define (maximum-wealth accounts)
  (apply max (map (curry foldl + 0) accounts)))

(maximum-wealth '((1 2 3) (3 2 1) (4 5 6)))
