#lang racket

(require rackunit)

(define (find-words-containing words c)
  (for/fold ([out '()]) ([w words] [i (range (length words))])
    (if (for/or ([char w]) (char=? c char) ) (append out (list i)) out)
    )
  )




(check-equal? (find-words-containing '("hello" "world" "racket") #\o) '(0 1))
(check-equal? (find-words-containing '("apple" "banana" "cherry") #\a) '(0 1))
