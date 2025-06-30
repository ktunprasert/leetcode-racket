#lang racket

(define (first-uniq-char s)
  (define freq (make-hash))
  (for ([c s])
    (hash-update! freq c add1 0))
  (or (for/first ([(c i) (in-indexed s)]
                  #:when (= 1 (hash-ref freq c)))
        i)
      -1))

(first-uniq-char "leetcode")
