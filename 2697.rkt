#lang racket

(define (make-smallest-palindrome s)
  (define slen (string-length s))
  (define sm (apply string (string->list s)))
  (define chead void)
  (define ctail void)
  (for* ([i (add1 (quotient slen 2))]
         #:do [(set! chead (string-ref s i)) (set! ctail (string-ref s (- slen i 1)))]
         #:unless (equal? chead ctail))
    (if (char<? chead ctail)
        (begin
          (string-set! sm i chead)
          (string-set! sm (- slen i 1) chead))
        (begin
          (string-set! sm i ctail)
          (string-set! sm (- slen i 1) ctail))))

  sm)

(make-smallest-palindrome "efcge")
(make-smallest-palindrome "abcd")
(make-smallest-palindrome "ab5cd")
(make-smallest-palindrome "seven")
