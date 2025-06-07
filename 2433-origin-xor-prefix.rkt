#lang racket

(define (find-array pref)
  (for/fold ([out empty]
             [prefix 0]
             #:result (reverse out))
            ([n (in-list pref)])
    (values (cons (bitwise-xor prefix n) out) (bitwise-xor prefix (bitwise-xor prefix n)))))

(find-array '(5 2 0 3 1))
