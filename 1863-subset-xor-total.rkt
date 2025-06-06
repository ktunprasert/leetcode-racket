#lang racket

(define (subset-xor-sum nums)
  (let ([n     (length nums)]
        [all-or (foldl bitwise-ior 0 nums)])
    (if (zero? n) 0
        (* (expt 2 (- n 1)) all-or))))


(require rackunit)

(check-equal? (subset-xor-sum '(1 3)) 6)
(check-equal? (subset-xor-sum '(5 1 6)) 28)
(check-equal? (subset-xor-sum '(3 4 5 6 7 8)) 480)
