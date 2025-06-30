#lang racket

(define (to-hex num)
  (if (negative? num)
      (number->string (+ (expt 2 32) num) 16)
      (number->string num 16)))

(to-hex 26)
(to-hex -1)
