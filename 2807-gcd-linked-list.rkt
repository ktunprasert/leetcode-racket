#lang racket

; Definition for singly-linked list:
; val : integer?
; next : (or/c list-node? #f)
(struct list-node (val next) #:mutable #:transparent)

; constructor
;; (define (make-list-node [val 0])
;;   (list-node val #f))

;; (define/contract (insert-greatest-common-divisors head)
;;   (-> (or/c list-node? #f) (or/c list-node? #f))
;;   )

;; (define (build-list-nodes vals)
;;   (if (null? vals) #f
;;       ((println (car vals))
;;        (list-node (car vals)
;;                   (build-list-nodes (cdr vals))))))

(define (build-list-nodes vals)
  (define head (list-node (car vals) #f))
  (let loop ([current head]
             [rest (cdr vals)])
    (if (null? rest)
        head
        (begin
          (set-list-node-next! current (list-node (car rest) #f))
          (loop (list-node-next current) (cdr rest))))))

(define (insert-greatest-common-divisors head)
  (let loop ([current head])
    (match (list-node-next current)
      [#f head]
      [next
       (begin
         (set-list-node-next! current
                              (list-node (gcd (list-node-val current) (list-node-val next)) next))
         (loop next))])))

(insert-greatest-common-divisors (build-list-nodes '(18 6 10 3)))
;; (insert-greatest-common-divisors #f)
