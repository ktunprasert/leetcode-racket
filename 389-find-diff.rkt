#lang racket

(define (find-the-difference s t)
  (integer->char (for/sum ([cs (string-append s (~a (integer->char 0)))] [ct t])
                          (- (char->integer ct) (char->integer cs)))))

(find-the-difference "abcd" "abcde")
(find-the-difference "aa" "aaa")
