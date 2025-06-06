#lang racket

(require "list-node-helper.rkt")

(define (merge-nodes head)
  (define vec (make-vector (* 2 (expt 10 5))))
  (let loop ([next (list-node-next head)]
             [i 0])
    (if (eq? #f next)
        (set! vec (vector-take vec i))
        (match (list-node-val next)
          [0 (loop (list-node-next next) (add1 i))]
          [n
           (begin
             (vector-set! vec i (+ (vector-ref vec i) n))
             (loop (list-node-next next) i))])))

  (let ([len (vector-length vec)])
    (let loop ([i (sub1 len)]
               [next #f])
      (if (< i 0)
          next
          (let ([node (list-node (vector-ref vec i) next)]) (loop (sub1 i) node))))))

(require rackunit)

(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0))) (build-list-nodes '(2)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 1 0 1 0))) (build-list-nodes '(2 1)))
(check-equal? (merge-nodes (build-list-nodes '(0 1 0 1 0 1 0))) (build-list-nodes '(1 1 1)))
