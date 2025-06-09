#lang racket

(define (subtract-product-and-sum n)
  (do ([num n (quotient num 10)]
       [sum 0 (+ sum (remainder num 10))]
       [product 1 (* product (remainder num 10))])
      ((= num 0) (- product sum))))

(subtract-product-and-sum 234)
;; (subtract-product-and-sum 234)
