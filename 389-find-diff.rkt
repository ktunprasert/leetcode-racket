#lang racket

(define/contract (find-the-difference s t)
  (-> string? string? char?)
  (for/first ([c t]
              #:unless (string-contains? s (~a c)))
    c))


(find-the-difference "abcd" "abcde")
