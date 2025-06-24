#lang racket

(define (minimum-average nums)
  (define mid (compose (curryr drop 1) (curryr drop-right 1)))
  (let loop ([nums (sort nums <)]
             [min-v +inf.0])
    (cond
      [(empty? nums) min-v]
      [else
       (define a (first nums))
       (define b (last nums))
       (loop (mid nums) (min min-v (/ (+ a b) 2)))])))

(minimum-average (list 7 8 3 4 15 13 4 1))
