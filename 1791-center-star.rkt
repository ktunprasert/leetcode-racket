#lang racket

(define/contract (find-center edges)
  (-> (listof (listof exact-integer?)) exact-integer?)
  (let ([first-edge (car edges)]
        [second-edge (cadr edges)])
    (if (member (car first-edge) second-edge)
        (car first-edge)
        (cadr first-edge))))

(find-center '((1 2) (2 3) (4 2)))
