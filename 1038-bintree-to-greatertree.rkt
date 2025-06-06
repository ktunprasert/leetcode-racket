#lang racket

(require "bin-tree-helper.rkt")

(define (bst-to-gst root)
  (define sum 0)
  (let loop ([node root])
    (when (tree-node? node)
      (begin
        (loop (tree-node-right node))

        (let ([n (tree-node-val node)])
          (begin
            (set-tree-node-val! node (+ n sum))
            (set! sum (+ sum n))))

        (loop (tree-node-left node)))))
  root)

;; (bst-to-gst (build-tree-in-order '(5 1 7)))
(bst-to-gst (build-tree-in-order '(4 1 6 0 2 5 7 3 8)))
