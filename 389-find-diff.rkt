#lang racket

(define/contract (find-the-difference s t)
  (-> string? string? char?)
  (or (for/first ([c t]
                  #:unless (string-contains? s (~a c)))
        c))
  (string-ref t (sub1 (string-length t))))

(find-the-difference "abcd" "abcde")
(find-the-difference "aa" "aaa")
