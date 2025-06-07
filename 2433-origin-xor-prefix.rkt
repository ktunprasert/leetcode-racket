#lang racket

(define (find-array pref)
  (for/fold ([out empty]
             [prefix 0]
             #:result (reverse out))
            ([n (in-list pref)])
    (let* ([found (bitwise-xor prefix n)]
           [prefix (bitwise-xor prefix found)])
      (values (cons found out) prefix))))

(find-array '(5 2 0 3 1))
