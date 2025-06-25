#lang racket

(define (sum-of-unique nums)
  (apply + (filter-map (λ (ls) (and (= 1 (length ls)) (first ls))) (group-by identity nums))))

(sum-of-unique '(1 1 1 1 1)) ; => 0
(sum-of-unique '(1 2 3 4 5)) ; => 15
