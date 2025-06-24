#lang racket

(define (merge-alternately word1 word2)
  (define sl1 (string-length word1))
  (define sl2 (string-length word2))
  (define out
    (if (> sl2 sl1)
        (string-append word1 word2)
        (string-append word2 word1)))
  (for ([i (in-range 0 (min sl1 sl2))])
    (define si (* i 2))
    (string-set! out si (string-ref word1 i))
    (string-set! out (add1 si) (string-ref word2 i)))
  out)

(merge-alternately "abc" "123")
(merge-alternately "abcdef" "123")
