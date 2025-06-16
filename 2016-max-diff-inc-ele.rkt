#lang racket

(define (maximum-difference nums)
  (if (< (length nums) 2)
      -1
      (for/fold ([min-so-far (first nums)]
                 [max-diff -1]
                 #:result max-diff)
                ([num (in-list (rest nums))])
        (define new-diff
          (if (> num min-so-far)
              (- num min-so-far)
              -1))
        (values (min min-so-far num) (max max-diff new-diff)))))

(maximum-difference '(7 1 5 4))
(maximum-difference '(9 4 3 2))
(maximum-difference '(1 5 2 10))
