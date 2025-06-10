#lang racket

(require "bin-tree-helper.rkt")

(define deepest 0)
(define total 0)
(define (deepest-leaves-sum root [depth 0])
  (cond
    [(and (false? (tree-node-left root)) (false? (tree-node-right root)))
     (set! deepest (max deepest depth))
     (when (= depth deepest)
       (set! total (+ total (tree-node-val root))))]
    [(false? (tree-node-left root)) (deepest-leaves-sum (tree-node-right root) (add1 depth))]
    [(false? (tree-node-right root)) (deepest-leaves-sum (tree-node-left root) (add1 depth))]
    [else
     (deepest-leaves-sum (tree-node-left root) (add1 depth))
     (deepest-leaves-sum (tree-node-right root) (add1 depth))])
  total)

(define tn make-tree-node)

(deepest-leaves-sum (tn 1 (tn 2 (tn 4 (tn 7)) (tn 5)) (tn 3 #f (tn 6 #f (tn 8)))))
