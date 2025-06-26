#lang racket

(define (can-alice-win nums)
  ((negate zero?) (for/sum ([n nums]) (if (< n 10) n (- n)))))

(can-alice-win (list 1 2 3 4 10))
(can-alice-win (list 1 2 3 4 5 14))
