#lang racket

(define (common-factors a b)
  (for/sum ([i (in-inclusive-range 1 1000)] #:when (and (>= a i) (>= b i))
                                            #:when (zero? (modulo a i))
                                            #:when (zero? (modulo b i)))
           1))

(common-factors 12 6)
