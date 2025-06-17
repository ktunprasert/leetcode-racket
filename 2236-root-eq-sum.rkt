#lang racket

(require "bin-tree-helper.rkt")

(define (check-tree root)
  (if (false? root)
      #f
      (let ([total-sum (sum-all-nodes root)]
            [root-val (tree-node-val root)])
        (= root-val (- total-sum root-val)))))

(define (sum-all-nodes node)
  (cond
    [(false? node) 0]
    [else (+ (tree-node-val node)
             (sum-all-nodes (tree-node-left node))
             (sum-all-nodes (tree-node-right node)))]))

(define t1 (make-tree-node 5 (make-tree-node 2) (make-tree-node 3)))
(define t2 (make-tree-node 1 (make-tree-node 2) (make-tree-node 3)))

(check-tree t1)
(check-tree t2)
