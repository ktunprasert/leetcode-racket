#lang racket

(define (is-acronym words s)
  (equal? (string->list s) (map (curryr string-ref 0) words)))

(is-acronym (list "alic" "bo" "ch") "abc")
