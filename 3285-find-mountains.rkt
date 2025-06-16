#lang racket

(define (stable-mountains height threshold)
  (for/list ([(n i) (in-indexed (drop-right height 1))]
             #:when (> n threshold))
    (add1 i)))

(stable-mountains (list 1 2 3 4 5) 2)
