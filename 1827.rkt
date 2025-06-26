#lang racket

(define (min-operations nums)
  (let loop ([start 0]
             [prev (car nums)]
             [nums (cdr nums)])
    (cond
      [(empty? nums) start]
      [(>= prev (car nums)) (loop (+ start (- (add1 prev) (car nums))) (add1 prev) (cdr nums))]
      [else (loop start (car nums) (cdr nums))])))

;; (min-operations (list 1 1 1))
(min-operations (list 1 5 2 4 1))
