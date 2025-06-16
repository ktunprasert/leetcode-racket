#lang racket

(define (bitcount n [count 0])
  (cond
    [(zero? n) count]
    [else (bitcount (bitwise-and n (sub1 n)) (add1 count))]))

(define (min-operations nums k)
  (bitcount (apply bitwise-xor (cons k nums))))

(min-operations (list 1 2 3 4) 1)
