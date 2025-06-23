#lang racket

(define/contract (sum-of-the-digits-of-harshad-number x)
  (-> exact-integer? exact-integer?)
  (define digits
    (let loop ([digits empty]
               [n x])
      (cond
        [(zero? n) (reverse digits)]
        [else (loop (cons (remainder n 10) digits) (quotient n 10))])))
  (if (zero? (modulo x (apply + digits)))
      (apply + digits)
      -1))

(sum-of-the-digits-of-harshad-number 18)
