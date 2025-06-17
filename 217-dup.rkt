#lang racket

(define (contains-duplicate nums)
  (let ([seen (mutable-set)])
    (for/or ([num nums])
      (cond
        [(set-member? seen num) #t]
        [else (set-add! seen num) #f]))))

(contains-duplicate '(1 2 3))
(contains-duplicate '(1 2 3 2))
