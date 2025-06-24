#lang racket

(define/contract (maximize-sum nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let loop ([n (apply max nums)]
             [offset 0]
             [total 0]
             [k k])
    (cond
      [(zero? k) total]
      [else (loop n (add1 offset) (+ total offset n) (sub1 k))])))

(maximize-sum '[5 5 5] 2)
