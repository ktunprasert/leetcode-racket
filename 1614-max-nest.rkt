#lang racket

(define (max-depth s)
  (define bracks (filter (lambda (c) (or (char=? c #\() (char=? c #\)))) (string->list s)))
  (let loop ([bracks bracks]
             [depth 0]
             [max-depth 0])
    (cond
      [(empty? bracks) (max depth max-depth)]
      [(char=? (first bracks) #\() (loop (cdr bracks) (add1 depth) (max max-depth (add1 depth)))]
      [else (loop (cdr bracks) (sub1 depth) max-depth)])))

(max-depth "(((1+2+3)))()")
