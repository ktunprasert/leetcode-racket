#lang racket

(require "bin-tree-helper.rkt")

(define (range-sum-bst root low high)
  (if (false? root)
      0
      (let* ([node-val (tree-node-val root)]
             [node-acc (if (and (<= node-val high) (>= node-val low)) node-val 0)]
             [right-acc (range-sum-bst (tree-node-right root) low high)]
             [left-acc (range-sum-bst (tree-node-left root) low high)])
        (+ node-acc right-acc left-acc))))

(range-sum-bst (build-tree-in-order '(1 2 3)) 1 3) ; 6
(range-sum-bst (build-tree-in-order '(10 5 15 3 7 18)) 7 15) ; 32
