#lang racket

(define (arithmetic-triplets nums diff)
  (for/sum ([(n1 i1) (in-indexed nums)])
           (for/sum ([n2 (drop nums (add1 i1))])
                    (for/sum ([n3 (drop nums (+ 2 i1))] #:when (= diff (- n2 n1) (- n3 n2))) 1))))

(arithmetic-triplets '(0 1 4 6 7 10) 3)
