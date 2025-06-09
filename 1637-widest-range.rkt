#lang racket

(define (max-width-of-vertical-area points)
  (define sorted-hash
    (for/hash ([i (in-naturals)]
               [v (sort (map (curry car) points) <)])
    (values i v)))
  (for/fold ([wide 0]) ([i (in-range (sub1 (length points)))])
    (define width (- (hash-ref sorted-hash (add1 i)) (hash-ref sorted-hash i)))
    (max wide width)))

(max-width-of-vertical-area '((8 7) (9 9) (7 4) (9 7)))
