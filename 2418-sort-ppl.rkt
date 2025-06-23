#lang racket

(define (sort-people names heights)
  (reverse (hash-values (for/hash ([n names]
                                   [h heights])
                          (values h n))
                        #t)))

(sort-people (list "Mary" "John" "Emma") (list 180 165 170))
