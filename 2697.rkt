#lang racket

(define (make-smallest-palindrome s)
  (define slen (string-length s))
  (for/sum ([i (in-range (quotient slen 2))] #:unless (equal? (string-ref s i)
                                                              (string-ref s (- slen i 1))))
           1))

(make-smallest-palindrome "abcd")
(make-smallest-palindrome "ab5cd")
