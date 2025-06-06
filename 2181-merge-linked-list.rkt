#lang racket

(require "list-node-helper.rkt")

(define (merge-nodes head)
  ;; (println head)
  (define merged-head #f)

  (let loop ([current head] [sum 0] [merged #f] )
    (match current
      ;; [#f merged]
      [#f (begin (println merged) merged)]
      [_
       (match (list-node-val current )
         [0 (loop (list-node-next current) 0
                  (begin
                    (if (eq? #f merged)
                        ;; (make-list-node sum)
                        (begin
                          (set! merged-head (make-list-node sum))
                          (make-list-node sum)
                          )
                        (begin
                          (set-list-node-next! merged (make-list-node sum))
                          (list-node-next merged)
                          ))

                    ))]
         [n (loop (list-node-next current) (+ sum n) merged)]
         )
       ] ) )

  merged-head
  )

(merge-nodes (build-list-nodes '(0 1 1 0 1 0)))
