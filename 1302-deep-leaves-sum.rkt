#lang racket

(require "bin-tree-helper.rkt")

(define deepest 0)
(define total 0)
(define (deepest-leaves-sum root [depth 0])
  (when (= depth 0)
    (set! deepest 0)
    (set! total 0))
  (cond
    [(false? root) 0]
    [else
     (when (= depth deepest)
       (set! total (+ total (tree-node-val root))))
     (when (> depth deepest)
       (set! deepest depth)
       (set! total (tree-node-val root)))
     (deepest-leaves-sum (tree-node-left root) (add1 depth))
     (deepest-leaves-sum (tree-node-right root) (add1 depth))])
  total)

(define tn make-tree-node)

(deepest-leaves-sum (tn 1 (tn 2 (tn 4 (tn 7)) (tn 5)) (tn 3 #f (tn 6 #f (tn 8)))))
(deepest-leaves-sum (tn 6 (tn 7 (tn 2 (tn 9)) (tn 7 (tn 1) (tn 4))) (tn 8 (tn 1) (tn 3 #f (tn 5)))))
