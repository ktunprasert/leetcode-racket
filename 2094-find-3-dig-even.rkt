#lang racket

(define (find-even-numbers digits)
  (define freq (make-vector 10 0))
  (for ([d digits])
    (vector-set! freq d (add1 (vector-ref freq d))))
  (for*/list ([a (in-range 1 10)]
              [b 10]
              [c (in-range 0 10 2)]
              #:when (> (vector-ref freq a) 0)
              #:when (> (vector-ref freq b) 0)
              #:when (> (vector-ref freq c) 0)
              #:unless (and (= a b c) (not (> (vector-ref freq a) 2)))
              #:unless (and (= a b) (not (> (vector-ref freq a) 1)))
              #:unless (and (= a c) (not (> (vector-ref freq a) 1)))
              #:unless (and (= b c) (not (> (vector-ref freq b) 1))))
    (+ (* 100 a) (* 10 b) c)))

(find-even-numbers '(2 1 3 0))
(find-even-numbers '(2 2 8 8 2))
