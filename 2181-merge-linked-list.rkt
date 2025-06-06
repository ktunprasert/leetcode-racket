#lang racket

(require "list-node-helper.rkt")

(define (merge-nodes head)
  (define new-head (make-list-node 0))
  (let loop ([next (list-node-next head)]
             [current new-head])
    (when (not (eq? #f next))
      (match (list-node-val next)
        [0 #:when (not (eq? #f (list-node-next next)))
         (begin
           (define current-next (make-list-node 0))
           (set-list-node-next! current current-next)
           (loop (list-node-next next) current-next))]
        [n
         (begin
           (set-list-node-val! current (+ n (list-node-val current)))
           (set-list-node-next! current (list-node-next next))
           (loop (list-node-next next) current))])))
  new-head)

(require rackunit)

(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0))) (build-list-nodes '(2)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0 1 0))) (build-list-nodes '(2 1)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 0 1 0 1 0))) (build-list-nodes '(1 1 1)))
