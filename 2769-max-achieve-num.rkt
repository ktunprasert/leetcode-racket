#lang racket

(require rackunit)

(define (the-maximum-achievable-x num t)
  (+ num (* 2 t)))


(check-equal? (the-maximum-achievable-x 4 1) 6)
(check-equal? (the-maximum-achievable-x 3 2) 7)
(check-equal? (the-maximum-achievable-x 1 1) 3)
