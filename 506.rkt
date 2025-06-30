#lang racket

(define (find-relative-ranks score)
  (define score-map
    (for/hash ([n (sort score >)]
               [i (sequence-append (list "Gold Medal" "Silver Medal" "Bronze Medal")
                                   (in-naturals 4))])
      (values n (~a i))))
  (map (curry hash-ref score-map) score))

(find-relative-ranks (list 5 4 3 2 1))
(find-relative-ranks (list 10 3 8 9 4))
