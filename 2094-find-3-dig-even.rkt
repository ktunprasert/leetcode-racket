#lang racket

(define (find-even-numbers digits)
  (define (dig-sum a b c)
    (+ (* 100 a) (* 10 b) c))
  (sort (set->list (for*/set ([a digits]
                              [b (remove a digits)]
                              [c (remove b (remove a digits))]
                              #:when (even? c)
                              #:unless (zero? a))
                     (dig-sum a b c)))
        <))

;; (find-even-numbers '(2 1 3 0))
(find-even-numbers '(2 2 8 8 2))
