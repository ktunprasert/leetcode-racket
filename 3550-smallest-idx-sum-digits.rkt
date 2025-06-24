#lang racket

(define (sum-digits n [total 0])
  (cond
    [(zero? n) total]
    [else (sum-digits (quotient n 10) (+ total (remainder n 10)))]))

(define (smallest-index nums)
  (or (for/first ([(n i) (in-indexed nums)]
                  #:when (= i (sum-digits n)))
        i)
      -1))

(smallest-index '[1 3 2])
(smallest-index '[1 10 11])
(smallest-index '[-1])
