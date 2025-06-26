#lang racket

(define (sum-of-squares nums)
  (define nlen (length nums))
  (for/sum ([(n i) (in-indexed nums)] #:when (= 0 (modulo nlen (add1 i)))) (* n n)))

;; (sum-of-squares '[1 2 3 4])
(sum-of-squares '[2 7 1 19 18 3])
