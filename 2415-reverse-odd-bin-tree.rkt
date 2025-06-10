#lang racket

(require "bin-tree-helper.rkt")

(define (reverse-odd-levels root
                            [left (tree-node-left root)]
                            [right (tree-node-right root)]
                            [depth 0])
  (if (false? left)
      root
      (begin
        (when (even? depth)
          (let ([left-val (tree-node-val left)]
                [right-val (tree-node-val right)])
            (set-tree-node-val! left right-val)
            (set-tree-node-val! right left-val)))

        (reverse-odd-levels root (tree-node-left left) (tree-node-right right) (add1 depth))
        (reverse-odd-levels root (tree-node-left right) (tree-node-right left) (add1 depth))

        root)))

(build-balanced-tree '(0 2 1 0 0 0 0 1 1 1 1 2 2 2 2))
(reverse-odd-levels (build-balanced-tree '(0 2 1 0 0 0 0 1 1 1 1 2 2 2 2)))
