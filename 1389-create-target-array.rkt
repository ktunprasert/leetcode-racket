#lang racket

(define (create-target-array nums index)
  (for/fold ([out empty])
            ([n nums]
             [i index])
    (match-define-values (a b) (split-at out i))
    (append a (list n) b)))

(create-target-array '(0 1 2 3 4) '(0 1 2 2 1))
