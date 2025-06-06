#lang racket

(require "list-node-helper.rkt")

(define (merge-nodes head)
  (let loop ([next (list-node-next head)]
             [current head]
             [prev head])
    (if (not (eq? #f next))
        (match (list-node-val next)
          [0 (loop (list-node-next next) (list-node-next current) current)]
          [n
           (begin
             (set-list-node-val! current (+ n (list-node-val current)))
             (set-list-node-next! current (list-node-next next))
             (loop (list-node-next next) current current))])
        (set-list-node-next! prev #f)))
  head)

(require rackunit)

(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0))) (build-list-nodes '(2)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0 1 0))) (build-list-nodes '(2 1)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 0 1 0 1 0))) (build-list-nodes '(1 1 1)))
