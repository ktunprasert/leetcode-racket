#lang racket

(define (num-digits n [digits 0])
  (cond
    [(zero? n) digits]
    [else (num-digits (quotient n 10) (add1 digits))]))

(define/contract (find-numbers nums)
  (-> (listof exact-integer?) exact-integer?)
  (count (compose even? num-digits) nums))

(find-numbers '[12 345 2 6 7896])
