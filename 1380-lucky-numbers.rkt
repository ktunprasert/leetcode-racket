#lang racket

(define (lucky-numbers matrix)
  (define (get-column matrix n)
    (map (curryr list-ref n) matrix))
  (define mins (map (curry apply min) matrix))
  (for/list ([row matrix]
             [n mins]
             #:when (= n (apply max (get-column matrix (index-of row n)))))
    n))

(lucky-numbers '[[3 7 8] [9 11 13] [15 16 17]])
(lucky-numbers '[[7 8] [1 2]])
