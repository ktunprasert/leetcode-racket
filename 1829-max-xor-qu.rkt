#lang racket

(define (get-maximum-xor nums maximumBit)
  (define target (sub1 (expt 2 maximumBit)))
  (for/foldr ([out empty] [prefix 0] #:result out)
             ([n2 (reverse nums)])
             (values (cons (bitwise-xor target prefix n2) out) (bitwise-xor prefix n2))))

(get-maximum-xor '[0 1 1 3] 2)
