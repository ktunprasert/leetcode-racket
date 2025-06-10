#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (match-let ([(list a b) (car edges)]
              [(list c d) (cadr edges)])
    (if (or (= a c) (= a d)) a b)))

(find-center '((1 2) (2 3) (4 2)))
