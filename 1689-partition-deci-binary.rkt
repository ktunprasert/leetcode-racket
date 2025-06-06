#lang racket

(define (cint c)
  (match c
    [#\0 0]
    [#\1 1]
    [#\2 2]
    [#\3 3]
    [#\4 4]
    [#\5 5]
    [#\6 6]
    [#\7 7]
    [#\8 8]
    [#\9 9]))

; first glance - just find maximum char and return that
(define (min-partitions str)
  (let loop ([max-char 0]
             [next (string->list str)])
    (if (null? next)
        max-char
        (match (car next)
          [#\9 9]
          [#\0 (loop max-char (cdr next))]
          [c (loop (max max-char (cint c)) (cdr next))]))))

(min-partitions "32")
(min-partitions "10000000000000000000000000009")
