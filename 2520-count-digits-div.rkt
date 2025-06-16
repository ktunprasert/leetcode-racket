#lang racket

(define (count-digits num [n num] [count 0])
  (cond
    [(= n 0) count]
    [else (count-digits num (quotient n 10) (+ count (if (= 0 (modulo num (remainder n 10))) 1 0)))]))

(count-digits 121)
