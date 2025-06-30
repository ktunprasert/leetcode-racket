#lang racket

(define (check-perfect-number num)
  (= (for/sum ([n (in-range 1 num)] #:when (zero? (modulo num n))) n) num))

(check-perfect-number 28)
(check-perfect-number 7)
