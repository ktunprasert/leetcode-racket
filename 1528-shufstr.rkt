#lang racket

(define (restore-string s indices)
  (let ([hs (for/hash ([s s]
                       [i indices])
              (values i s))])
    (list->string (hash-values hs #t))))

(restore-string "codeleet" (list 4 5 6 7 0 2 1 3))
