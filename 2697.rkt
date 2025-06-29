#lang racket

(define (make-smallest-palindrome s)
  (define slen (string-length s))
  (define slist (string->list s))
  (define sm (apply string slist))
  (for ([i (quotient slen 2)]
        [chead s]
        [ctail (reverse slist)]
        #:unless (equal? chead ctail))
    (if (char<? chead ctail)
        (string-set! sm (- slen i 1) chead)
        (string-set! sm i ctail)))
  sm)

(make-smallest-palindrome "efcge")
(make-smallest-palindrome "abcd")
(make-smallest-palindrome "ab5cd")
(make-smallest-palindrome "seven")
