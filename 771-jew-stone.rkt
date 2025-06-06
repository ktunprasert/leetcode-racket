#lang racket

; hash-map sum
(define (num-jewels-in-stones jewels stones)
  (let ([hash (foldl (lambda (c h) (hash-set h c #t)) '#hash() (string->list jewels))])
    (for/sum ([c stones] #:when (hash-has-key? hash c)) 1)))

(num-jewels-in-stones "aA" "aAAbbbb")
