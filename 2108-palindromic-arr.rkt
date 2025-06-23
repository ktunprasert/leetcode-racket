#lang racket

(define (first-palindrome words)
  (or (for/or ([w words])
        (if (for/and ([c w]
                      [i (in-naturals)])
              #:break (> i (quotient (string-length w) 2))
              (char=? (string-ref w (- (sub1 (string-length w)) i)) c))
            w
            #f))
      ""))

(first-palindrome '("abc" "def" "racecar"))
(first-palindrome '("abc" "def"))
