#lang racket

(define/contract (xor-operation n start)
  (-> exact-integer? exact-integer? exact-integer?)

  (define total 0)
  (for ([i (in-naturals)]
        [_ (in-range (+ 0 n))])
    (let ([v (+ start (* 2 i))]) (set! total (bitwise-xor total v))))

  total)

(xor-operation 5 0)
(xor-operation 4 3)
(xor-operation 1 7)
