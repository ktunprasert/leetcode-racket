#lang racket

; im too lazy to optimise this
(define (count-max-or-subsets nums)
  (define max-or (apply bitwise-ior nums))
  (for/fold ([count 0])
            ([lst (in-combinations nums)]
             #:when (= max-or (apply bitwise-ior lst)))
    (add1 count)))

(count-max-or-subsets '(3 1))
(count-max-or-subsets '(2 2 2))
(count-max-or-subsets '(3 2 1 5))
