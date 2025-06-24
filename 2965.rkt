#lang racket

(define (find-missing-and-repeated-values grid)
  (define ls (sort (flatten grid) <))
  (define duped (check-duplicates ls))
  (for/fold ([ns 0]
             [is 0]
             #:result (list duped (abs (- ns is duped))))
            ([(n i) (in-indexed ls)])
    (values (+ n ns) (+ i is 1))))

(find-missing-and-repeated-values '((1 3) (2 2)))
(find-missing-and-repeated-values '[[9 1 7] [8 9 2] [3 4 6]])
