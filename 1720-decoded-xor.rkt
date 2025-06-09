#lang racket

(define/contract (decode encoded first)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (define prefix first)
  (let ([out (for/list ([n encoded])
               (begin0 (bitwise-xor n prefix)
                 (set! prefix (bitwise-xor n prefix))))])

    (append (list first) out)))

(decode '(1 2 3) 1) ; 1 0 2 1
