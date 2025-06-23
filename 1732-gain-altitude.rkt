#lang racket

(define (largest-altitude gain)
  (apply max (foldl (λ (n acc) (cons (+ (first acc) n) acc)) '(0) gain)))

(largest-altitude '(-5 1 5 0 -7))
