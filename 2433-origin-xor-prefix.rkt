#lang racket

(define/contract (find-array pref)
  (-> (listof exact-integer?) (listof exact-integer?))
  (let loop ([cache 0]
             [rest pref]
             [out '()])
    (if (null? rest)
        (reverse out)
        (let* ([n (car rest)]
               [new (bitwise-xor cache n)])
          (loop (bitwise-xor cache new) (cdr rest) (cons new out))))))

(find-array '(5 2 0 3 1)) ; 5,7,2,3,2
