#lang racket

(define memoize (make-hash))
(define (make-anagram-key s)
  (if (hash-has-key? memoize s)
      (hash-ref memoize s)
      (sort (string->list s) char<?)))

(define (group-anagrams strs)
  (let ([groups (make-hash)])
    (for ([str strs])
      (let ([key (sort (string->list str) char<?)])
        (hash-update! groups key (lambda (lst) (cons str lst)) '())))
    (hash-values groups)))

(group-anagrams '("eat" "tea" "tan" "ate" "nat" "bat"))
(group-anagrams '("" "c" "d"))
