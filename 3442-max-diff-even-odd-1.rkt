#lang racket

(define (max-difference s)
  (let*-values ([(grouped) (group-by identity (string->list s))]
                [(lens) (map length grouped)]
                [(even odd) (partition even? lens)])
    (- (apply max odd) (apply min even))))

(max-difference "1112233") ; 1
