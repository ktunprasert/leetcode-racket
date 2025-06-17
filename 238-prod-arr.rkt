#lang racket

(define (product-except-self nums)
  (define n (length nums))
  (define result (make-vector n 1))
  (for ([i (in-range 1 n)])
    (vector-set! result i (* (vector-ref result (- i 1))
                             (list-ref nums (- i 1)))))
  (define right-product 1)
  (for ([i (in-range (- n 1) -1 -1)])
    (vector-set! result i (* (vector-ref result i) right-product))
    (set! right-product (* right-product (list-ref nums i))))

  (vector->list result))

(product-except-self (list 1 2 3 4)) ;; => (24 12 8 6)
(product-except-self (list 2 2 3 4)) ;; => (24 24 16 12)
(product-except-self (list -1 1 0 -3 3)) ;; => (0 0 9 0 0)
