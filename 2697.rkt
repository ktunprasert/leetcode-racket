#lang racket

(define (make-smallest-palindrome s)
  (define slen (string-length s))
  (for*/lists (head tail
                    #:result (if (even? slen)
                                 (list->string (append (drop-right head 1) (cdr (reverse tail))))
                                 (list->string (append head (cdr (reverse tail))))))
              ([i (add1 (quotient slen 2))])
              (define chead (string-ref s i))
              (define ctail (string-ref s (- slen i 1)))
              (if (char<? chead ctail)
                  (values chead chead)
                  (values ctail ctail))))

(make-smallest-palindrome "efcge")
(make-smallest-palindrome "abcd")
(make-smallest-palindrome "ab5cd")
(make-smallest-palindrome "seven")
