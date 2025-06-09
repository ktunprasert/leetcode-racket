#lang racket

(define (max-width-of-vertical-area points)
  (define sorted-points (sort (map (curry car) points) <))
  (for/fold ([wide 0]) ([i (in-range (sub1 (length points)))])
    (define width (- (list-ref sorted-points (add1 i)) (list-ref sorted-points i)))
    (max wide width)

    ))

(max-width-of-vertical-area '((8 7) (9 9) (7 4) (9 7)))
