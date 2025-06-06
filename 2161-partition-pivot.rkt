#lang racket

(define (pivot-array nums pivot)
  ((compose (curry apply append)
            (curryr sort #:key car <)
            (curry group-by
                   (lambda (n)
                     (cond
                       [(> n pivot) 1]
                       [(< n pivot) -1]
                       [else 0]))))
   nums))

(require rackunit)

(check-equal? (pivot-array '(9 12 5 10 14 3 10) 10) '(9 5 3 10 10 12 14))
(check-equal? (pivot-array '(-3 4 3 2) 2) '(-3 2 4 3))

(check-equal? (pivot-array '(4 0 4 5 -11) 5) '(4 0 4 -11 5))
(check-equal? (pivot-array '(19 15 12 -14 8 -7 -11) -7) '(-14 -11 -7 19 15 12 8))
