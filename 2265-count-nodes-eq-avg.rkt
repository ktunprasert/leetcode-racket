#lang racket

(require "bin-tree-helper.rkt")

(define/contract (average-of-subtree root)
  (-> (or/c tree-node? #f) exact-integer?)
  (define hashish (make-hash))
  (define node-total 0)
  (define node-count 0)

  (let loop ([node root])
    (match node
      [#f 0]
      [n
       (hash-update! hashish (tree-node-val n) add1 0)
       (set! node-total (+ node-total (tree-node-val n)))
       (set! node-count (add1 node-count))
       (loop (tree-node-left node))
       (loop (tree-node-right node))]))

  (hash-ref hashish (quotient node-total node-count) 0))

(average-of-subtree (make-tree-node 1
                                    (make-tree-node 2 (make-tree-node 3) (make-tree-node 4))
                                    (make-tree-node 5 (make-tree-node 6) (make-tree-node 7))))
