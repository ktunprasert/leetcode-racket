#lang racket

(define (count-digits num [n num] [count 0])
  (cond
    [(= n 0) count]
    [(= 0 (modulo num (remainder n 10))) (count-digits num (quotient n 10) (add1 count))]
    [else (count-digits num (quotient n 10) count)]))

(count-digits 121)
