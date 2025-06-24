#lang racket

(define/contract (prefix-count words pref)
  (-> (listof string?) string? exact-integer?)
  (count (curryr string-prefix? pref) words))
