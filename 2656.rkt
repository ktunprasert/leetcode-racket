#lang racket

(define/contract (maximize-sum nums k)
  (-> (listof exact-integer?) exact-integer? exact-integer?)
  (let loop ([nums nums]
             [offset 0]
             [total 0]
             [k k])
    (cond
      [(zero? k) total]
      [else (loop nums (add1 offset) (+ total offset (apply max nums)) (sub1 k))])))

(maximize-sum '[5 5 5] 2)
