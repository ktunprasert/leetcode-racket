#lang racket

(define/contract (max-product nums)
  (-> (listof exact-integer?) exact-integer?)
  (apply * (map sub1 (take (sort nums >) 2))))

(max-product (list 1 2 3 4 5))
