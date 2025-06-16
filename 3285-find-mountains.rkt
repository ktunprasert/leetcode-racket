#lang racket

(define (stable-mountains height threshold)
  (for/fold ([out empty])
            ([i (in-range (sub1 (length height)))]
             #:when (> (first (drop height i)) threshold))
    (cons (add1 i) out)))

(stable-mountains (list 1 2 3 4 5) 2)
