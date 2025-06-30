#lang racket

(define (is-subsequence s t)
  (for/and ([c s])
    (string-contains? t (~a c))))

(is-subsequence "x" "affbc")
