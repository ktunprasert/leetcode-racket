#lang racket

(define (subset-xor-sum nums)
  (for/sum ([ls (in-combinations nums)])
    (apply bitwise-xor ls)
    )
  )


(require rackunit)

(check-equal? (subset-xor-sum '(1 3)) 6)
(check-equal? (subset-xor-sum '(5 1 6)) 28)
(check-equal? (subset-xor-sum '(3 4 5 6 7 8)) 480)
