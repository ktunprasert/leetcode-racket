#lang racket

(define memoize (make-hash))
(define (sort-convert s)
  (if (hash-has-key? memoize s)
      (hash-ref memoize s)
      (let ([sorted (sort (string->list s) char<?)])
        (hash-set! memoize s sorted)
        sorted)))

(define (string-anagram-eq? a b)
  (equal-always? (sort-convert a) (sort-convert b)))

(define (group-anagrams strs)
  (group-by identity strs string-anagram-eq?))

(group-anagrams '("eat" "tea" "tan" "ate" "nat" "bat"))
(group-anagrams '("" "c" "d"))
