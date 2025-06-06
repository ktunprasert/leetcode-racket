#lang racket

(define/contract (find-array pref)
  (-> (listof exact-integer?) (listof exact-integer?))
  (define prefix 0)
  (for/list ([n pref])
    (begin
      (define new (bitwise-xor prefix n))
      (set! prefix (bitwise-xor prefix new))
      new)))

(find-array '(5 2 0 3 1))
