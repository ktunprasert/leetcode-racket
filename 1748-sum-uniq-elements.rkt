#lang racket

(define (sum-of-unique nums)
  (apply + (flatten (filter (compose (curry = 1) length) (group-by identity nums)))))

(sum-of-unique '(1 1 1 1 1)) ; => 0
(sum-of-unique '(1 2 3 4 5)) ; => 15
