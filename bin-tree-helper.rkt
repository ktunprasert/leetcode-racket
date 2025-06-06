#lang racket

(provide (all-defined-out))

; Definition for a binary tree node.
; val : integer?
; left : (or/c tree-node? #f)
; right : (or/c tree-node? #f)
(struct tree-node (val left right) #:mutable #:transparent)

; constructor
(define (make-tree-node [val 0])
  (tree-node val #f #f))

;; Build a balanced BST from a sorted list
(define (build-balanced-tree vals)
  (if (null? vals)
      #f
      (let ([sorted-vals (sort vals <)]) (build-balanced-helper sorted-vals))))

(define (build-balanced-helper sorted-list)
  (if (null? sorted-list)
      #f
      (let* ([len (length sorted-list)]
             [mid (quotient len 2)]
             [left-part (take sorted-list mid)]
             [middle (list-ref sorted-list mid)]
             [right-part (drop sorted-list (add1 mid))])
        (tree-node middle (build-balanced-helper left-part) (build-balanced-helper right-part)))))

;; Alternative: Build from unsorted list
(define (build-balanced-tree-unsorted vals)
  (build-balanced-tree vals)) ; sorts internally

;; More memory-efficient version using vector
(define (build-balanced-tree-fast vals)
  (if (null? vals)
      #f
      (let ([sorted-vec (list->vector (sort vals <))])
        (build-from-vector sorted-vec 0 (sub1 (vector-length sorted-vec))))))

(define (build-from-vector vec start end)
  (if (> start end)
      #f
      (let ([mid (quotient (+ start end) 2)])
        (tree-node (vector-ref vec mid)
                   (build-from-vector vec start (sub1 mid))
                   (build-from-vector vec (add1 mid) end)))))

;; Helper function to visualize the tree
(define (print-tree node [depth 0])
  (when node
    (print-tree (tree-node-right node) (add1 depth))
    (display (make-string (* depth 4) #\space))
    (displayln (tree-node-val node))
    (print-tree (tree-node-left node) (add1 depth))))

(define (insert-node root val)
  (cond
    [(not root) (tree-node val #f #f)]
    [(< val (tree-node-val root))
     (set-tree-node-left! root (insert-node (tree-node-left root) val))
     root]
    [else
     (set-tree-node-right! root (insert-node (tree-node-right root) val))
     root]))

;; Build tree from list in insertion order
(define (build-tree-in-order vals)
  (if (null? vals)
      #f
      (let ([root (tree-node (car vals) #f #f)])
        (for ([val (cdr vals)])
          (insert-node root val))
        root)))
