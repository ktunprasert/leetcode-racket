#lang racket

(define (charkey c)
  (- (char->integer c) 97))

(define (encode s)
  (define b (make-bytes 26))
  (for ([s s])
    (let* ([k (charkey s)]
           [n (bytes-ref b k)])
      (bytes-set! b k (+ n 1))))
  b)

(define (group-anagrams strs)
  (group-by encode strs))

(encode "eat")
(encode "ate")

(group-anagrams '("eat" "tea" "tan" "ate" "nat" "bat"))
(group-anagrams '("" "c" "d"))
