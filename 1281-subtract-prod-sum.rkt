#lang racket

(define (subtract-product-and-sum n [sum 0] [product 1])
  (if (= 0 n)
      (- product sum)
      (subtract-product-and-sum (quotient n 10)
                                (+ sum (remainder n 10))
                                (* product (remainder n 10)))))

(subtract-product-and-sum 234)
;; (subtract-product-and-sum 234)
