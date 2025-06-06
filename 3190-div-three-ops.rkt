#lang racket

(define minimum-operations (curry count (lambda (n) (> (modulo n 3) 0))))

(minimum-operations '(3 6 9))
(minimum-operations '(1 1 1))
