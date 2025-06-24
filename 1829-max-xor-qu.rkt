#lang racket

(define (get-maximum-xor nums maximumBit)
  (define target (sub1 (expt 2 maximumBit)))
  (for/fold ([out empty]
             [prefix 0]
             #:result out)
            ([n nums])
    (values (cons (bitwise-xor target prefix n) out) (bitwise-xor prefix n))))

(get-maximum-xor '[0 1 1 3] 2)
