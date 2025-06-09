#lang racket

(define (max-width-of-vertical-area points)
  (define sorted-x (sort (map car points) <))
  (apply max (map - (cdr sorted-x) (drop-right sorted-x 1))))

(max-width-of-vertical-area '((8 7) (9 9) (7 4) (9 7)))
