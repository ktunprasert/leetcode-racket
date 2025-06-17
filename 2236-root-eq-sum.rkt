#lang racket

(require "bin-tree-helper.rkt")

(define (check-tree root)
  (= (tree-node-val root)
     (+ (tree-node-val (tree-node-left root)) (tree-node-val (tree-node-right root)))))

(define t1 (make-tree-node 5 (make-tree-node 2) (make-tree-node 3)))
(define t2 (make-tree-node 1 (make-tree-node 2) (make-tree-node 3)))

(check-tree t1)
(check-tree t2)
