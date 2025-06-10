#lang racket

(require "bin-tree-helper.rkt")

(define deepest (make-parameter 0))
(define total (make-parameter 0))
(define (deepest-leaves-sum root)
  (parameterize ([deepest 0]
                 [total 0])
    (define (helper node d)
      (cond
        [(false? node) 0]
        [else
         (when (= d (deepest))
           (total (+ (total) (tree-node-val node))))
         (when (> d (deepest))
           (deepest d)
           (total (tree-node-val node)))
         (helper (tree-node-left node) (add1 d))
         (helper (tree-node-right node) (add1 d))]))
    (helper root 0)
    (total)))

(define tn make-tree-node)

(deepest-leaves-sum (tn 1 (tn 2 (tn 4 (tn 7)) (tn 5)) (tn 3 #f (tn 6 #f (tn 8)))))
(deepest-leaves-sum (tn 6 (tn 7 (tn 2 (tn 9)) (tn 7 (tn 1) (tn 4))) (tn 8 (tn 1) (tn 3 #f (tn 5)))))
