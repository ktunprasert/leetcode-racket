#lang racket

(define (get-maximum-xor nums maximumBit)
  (define target (sub1 (expt 2 maximumBit)))
  (define prefix 0)
  (reverse (for/list ([n nums])
             (begin0 (bitwise-xor target prefix n)
               (set! prefix (bitwise-xor prefix n))))))

(get-maximum-xor '[0 1 1 3] 2)
