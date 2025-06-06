#lang racket

(require "list-node-helper.rkt")

(define (merge-nodes head)
  (println "begin")
  (println head)

  (let loop ([next (list-node-next head)]
             [current head])
    (when (not (eq? #f next))
      (begin
        ;; (eprintf "\t next~a current~a\n" (list-node-val next) (list-node-val current))
        (match (list-node-val next)
          [0
           (begin
             ;; (set-list-node-next! current (list-node-next next))
             (loop (list-node-next next) (list-node-next current)))]
          [n
           (begin
             (set-list-node-val! current (+ n (list-node-val current)))
             (set-list-node-next! current (list-node-next next))
             ;; (loop (list-node-next next) (list-node-next current)))]))]))
             (loop (list-node-next next) current))]))))

  head)

;; (merge-nodes (build-list-nodes '(0 1 1 0)))
(merge-nodes (build-list-nodes '(0 1 1 0 1 0)))
