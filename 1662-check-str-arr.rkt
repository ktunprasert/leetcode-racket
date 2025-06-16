#lang racket

(define/contract (array-strings-are-equal word1 word2)
  (-> (listof string?) (listof string?) boolean?)
  (string=? (string-join word1 "") (string-join word2 "")))

(array-strings-are-equal '("abc" "def") '("abcdef"))
