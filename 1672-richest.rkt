#lang racket

(define (maximum-wealth accounts)
  (apply max (map (lambda (x) (foldl + 0 x)) accounts)))

(maximum-wealth '((1 2 3) (3 2 1) (4 5 6)))
