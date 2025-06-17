#lang racket

(define (digit-sum n [sum 0])
  (cond
    [(zero? n) sum]
    [else (digit-sum (quotient n 10) (+ sum (remainder n 10) ))]))

(define (difference-of-sum nums)
  (for/fold ([ele 0]
             [digit 0]
             #:result (abs (- ele digit)))
            ([n nums])
    (values (+ ele n) (+ digit (digit-sum n)))))

(difference-of-sum (list 1 15 6 3))
