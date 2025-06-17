#lang racket

(define (top-k-frequent nums k)
  (define ngroup (sort (group-by identity nums) (lambda (a b) (> (length a) (length b)))))
  (for/list ([_ (in-range k)]
             [ng ngroup])
    (first ng)))

(top-k-frequent '(1 1 1 2 2 3) 2) ; 1 2
(top-k-frequent '(1) 1) ; 1
(top-k-frequent '(3) 1) ; 1
(top-k-frequent '(1 2) 2) ; 1
(top-k-frequent '(-1 -2 -1 -2 -1 -2 -1 -1 9 -162931 96987 694873) 2) ; 1
