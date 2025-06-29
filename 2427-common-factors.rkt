#lang racket

(define (common-factors a b)
  (count (λ (i) (and (zero? (modulo a i)) (zero? (modulo b i)))) (inclusive-range 1 (max a b))))

(common-factors 12 6)
