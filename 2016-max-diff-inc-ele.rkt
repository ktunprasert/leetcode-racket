#lang racket

(require threading)

(define (maximum-difference nums)
  (for/fold ([min-so-far (first nums)]
             [max-diff -1]
             #:result max-diff)
            ([num (in-list (rest nums))])
    (~> (if (> num min-so-far)
            (- num min-so-far)
            -1)
        (max max-diff)
        (values (min min-so-far num) _))))

(maximum-difference '(7 1 5 4))
(maximum-difference '(9 4 3 2))
(maximum-difference '(1 5 2 10))
