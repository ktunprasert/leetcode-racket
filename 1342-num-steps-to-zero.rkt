#lang racket

(define/contract (number-of-steps num [steps 0])
  (-> exact-integer? exact-integer?)
  (cond
    [(= num 0) steps]
    [(even? num) (number-of-steps (arithmetic-shift num -1) (add1 steps))]
    [else (number-of-steps (sub1 num) (add1 steps))]))

(number-of-steps 14)
