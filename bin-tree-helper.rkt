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

(define (build-list-nodes vals)
  (define head (tree-node (car vals) #f #f))
  (let loop ([current head]
             [rest (cdr vals)])
    (if (null? rest)
        head
        (begin
          (set-tree-node-left! current (tree-node (car rest) #f #f))
          (loop (tree-node-left current) (cdr rest))))))
