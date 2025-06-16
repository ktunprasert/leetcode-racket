#lang racket

(define/contract (truncate-sentence s k)
  (-> string? exact-integer? string?)
  (string-join (take (string-split s) k)))

(truncate-sentence "hello world" 2)
