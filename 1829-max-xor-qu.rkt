#lang racket

(define (get-maximum-xor nums maximumBit)
  (define target (sub1 (expt 2 maximumBit)))
  (for/fold ([out empty]
             [prefix target]
             #:result out)
            ([n nums])
    (define next (bitwise-xor prefix n))
    (values (cons next out) next)))

(get-maximum-xor '[0 1 1 3] 2)
