#lang racket

(define (find-permutation-difference s t)
  (let ([h-s (for/hash ([c (in-string s)]
                        [i (in-naturals)])
               (values c i))]
        [h-t (for/hash ([c (in-string t)]
                        [i (in-naturals)])
               (values c i))])
    (for/sum ([c (in-hash-keys h-s)]) (abs (- (hash-ref h-s c) (hash-ref h-t c))))))

(find-permutation-difference "abc" "bac")
(find-permutation-difference "abcde" "edbac")
