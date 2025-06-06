#lang racket

;; (define (get-sneaky-numbers nums)
;;   (for/list ([lst (group-by values nums)]
;;              #:when (= 2 (length lst)))
;;     (car lst)))

(define (get-sneaky-numbers nums)
  (define hash-brown (make-hash))
  (define beaky '())
  (define found 0)
  (for ([n nums]
        #:break (= found 2))
    (if (hash-has-key? hash-brown n)
        (begin
          (set! beaky (cons n beaky))
          (set! found (add1 found)))
        (hash-set! hash-brown n #t)))

  beaky)

(get-sneaky-numbers '(0 1 1 0))
(get-sneaky-numbers '(0 3 2 1 3 2))
