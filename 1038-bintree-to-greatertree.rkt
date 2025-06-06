#lang racket

(require "bin-tree-helper.rkt")

(define (bst-to-gst root)
  (define shish (make-hash))
  (define sum 0)
  (let loop ([node root])
    (if (eq? #f node)
        #f
        (begin
          (let ([n (tree-node-val node)])
            (begin
              (hash-set! shish n 0)
              (set! sum (+ sum n))))

          (loop (tree-node-left node))
          (loop (tree-node-right node)))))

  (let ([all (hash-keys shish)])
    (for ([n all])
      (hash-set! shish n (- sum (apply + (filter (curryr < n) all))))))

  (let loop ([node root])
    (if (eq? #f node)
        #f
        (begin
          (let ([n (tree-node-val node)])
            (begin
              (set-tree-node-val! node (hash-ref shish n))))
          (loop (tree-node-left node))
          (loop (tree-node-right node)))))

  root)

(bst-to-gst (build-tree-in-order '(5 1 7)))
(bst-to-gst (build-tree-in-order '(4 1 6 0 2 5 7 3 8)))
