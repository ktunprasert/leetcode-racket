#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (let ([a (caar edges)]
        [b (cadar edges)]
        [c (caadr edges)]
        [d (cadadr edges)])
    (if (or (= a c) (= a d)) a b)))

(find-center '((1 2) (2 3) (4 2)))
