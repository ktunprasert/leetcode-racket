#lang racket

(define (find-the-prefix-common-array a b)
  (define counts (make-vector 51 0))
  (define total 0)
  (for/list ([x a] [y b])
    (vector-set! counts x (+ 1 (vector-ref counts x)))
    (when (= 2 (vector-ref counts x)) (set! total (+ total 1)))
    (vector-set! counts y (+ 1 (vector-ref counts y)))
    (when (= 2 (vector-ref counts y)) (set! total (+ total 1)))
    total))

(find-the-prefix-common-array '(1 3 2 4) '(3 1 2 4)) ; 0 2 3 4
(find-the-prefix-common-array '(2 3 1) '(3 1 2)) ; 0 1 3
