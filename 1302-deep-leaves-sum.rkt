#lang racket

(require "bin-tree-helper.rkt")

(define (deepest-leaves-sum root)
  (define (helper node depth)
    (cond
      [(false? node) (values -1 0)] ; depth -1 means no node, sum 0
      [(and (false? (tree-node-left node)) (false? (tree-node-right node)))
       (values depth (tree-node-val node))] ; leaf node
      [else
       (define-values (left-depth left-sum) (helper (tree-node-left node) (add1 depth)))
       (define-values (right-depth right-sum) (helper (tree-node-right node) (add1 depth)))
       (cond
         [(> left-depth right-depth) (values left-depth left-sum)]
         [(> right-depth left-depth) (values right-depth right-sum)]
         [else (values left-depth (+ left-sum right-sum))])]))
  (define-values (_ total) (helper root 0))
  total)

(define tn make-tree-node)

(deepest-leaves-sum (tn 1 (tn 2 (tn 4 (tn 7)) (tn 5)) (tn 3 #f (tn 6 #f (tn 8)))))
(deepest-leaves-sum (tn 6 (tn 7 (tn 2 (tn 9)) (tn 7 (tn 1) (tn 4))) (tn 8 (tn 1) (tn 3 #f (tn 5)))))
