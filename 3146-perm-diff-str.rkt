#lang racket

(define (find-permutation-difference s t)
  (for/fold ([h (make-immutable-hash)]
             #:result (apply + (hash-values h)))
            ([c1 (in-string s)]
             [c2 (in-string t)]
             [i (in-naturals)])
    (let* ([h (hash-update h c1 (curry - i) 0)]
           [h (hash-update h c2 (curry - i) 0)])
      h)))

(find-permutation-difference "abc" "bac")
(find-permutation-difference "abcde" "edbac")
