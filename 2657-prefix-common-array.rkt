#lang racket

(define (find-the-prefix-common-array a b)
  (define h (make-hash))
  (define result (make-vector (length a)))
  (define count 0)
  (for ([i (in-naturals)]
        [x a]
        [y b])
    (hash-set! h x (+ 1 (hash-ref h x 0)))
    (when (= 2 (hash-ref h x)) (set! count (+ count 1)))
    (hash-set! h y (+ 1 (hash-ref h y 0)))
    (when (= 2 (hash-ref h y)) (set! count (+ count 1)))
    (vector-set! result i count))
  (vector->list result))

(find-the-prefix-common-array '(1 3 2 4) '(3 1 2 4)) ; 0 2 3 4
(find-the-prefix-common-array '(2 3 1) '(3 1 2)) ; 0 1 3
