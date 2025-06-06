#lang racket

(define (hamming-weight n)
  (let loop ([n n]
             [count 0])
    (match n
      [0 count]
      [_ (loop (bitwise-and n (sub1 n)) (add1 count))])))

(hamming-weight 11)
(hamming-weight 128)
(hamming-weight 2147483645)
