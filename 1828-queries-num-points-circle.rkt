#lang racket

(define (within-circle a b x y r)
  (<= (+ (expt (- a x) 2) (expt (- b y) 2)) (expt r 2)))

(define/contract (count-points points queries)
  (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)) (listof exact-integer?))

  (for/list ([q queries])
    (for/sum ([p points] #:when (within-circle (car p) (cadr p) (car q) (cadr q) (caddr q))) 1)))

(count-points '((1 3) (3 3) (5 3) (2 2)) '((2 3 1) (4 3 1) (1 1 2)))
(count-points '((1 1) (2 2) (3 3) (4 4) (5 5)) '((1 2 2) (2 2 2) (4 3 2) (4 3 3)))
