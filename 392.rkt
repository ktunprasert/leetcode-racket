#lang racket

(define (is-subsequence s t)
  (let loop ([s (string->list s)]
             [t (string->list t)])
    (cond
      [(empty? s) #t]
      [(empty? t) #f]
      [(char=? (first s) (first t)) (loop (cdr s) (cdr t))]
      [else (loop s (cdr t))])))

(is-subsequence "" "affbc")
(is-subsequence "abc" "affbc")
