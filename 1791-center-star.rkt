#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (match-let ([(list a b) (car edges)])
    (if (member a (cadr edges)) a b)))

(find-center '((1 2) (2 3) (4 2)))
