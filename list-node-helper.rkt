#lang racket

(provide (all-defined-out))
; Definition for singly-linked list:

; val : integer?
; next : (or/c list-node? #f)
(struct list-node (val next) #:mutable #:transparent)

; constructor
(define (make-list-node [val 0])
  (list-node val #f))

(define (build-list-nodes vals)
  (define head (list-node (car vals) #f))
  (let loop ([current head]
             [rest (cdr vals)])
    (if (null? rest)
        head
        (begin
          (set-list-node-next! current (list-node (car rest) #f))
          (loop (list-node-next current) (cdr rest))))))
