#lang racket

(define (sum n)
  (/ (* n (add1 n)) 2))

(define (find-missing-and-repeated-values grid)
  (define ls (sort (flatten grid) <))
  (define duped (check-duplicates ls))
  (list duped (- (sum (length ls)) (- (apply + ls) duped))))

(find-missing-and-repeated-values '((1 3) (2 2)))
(find-missing-and-repeated-values '[[9 1 7] [8 9 2] [3 4 6]])
