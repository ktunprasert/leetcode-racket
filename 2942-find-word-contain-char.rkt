#lang racket

(require rackunit)

(define (find-words-containing words c)
  (for/list ([(w i) (in-indexed words)] #:when (string-contains? w (string c))) i)
  )




(check-equal? (find-words-containing '("hello" "world" "racket") #\o) '(0 1))
(check-equal? (find-words-containing '("apple" "banana" "cherry") #\a) '(0 1))
