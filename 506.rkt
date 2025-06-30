#lang racket

(define (find-relative-ranks score)
  (define score-map
    (for/hash ([n (sort score >)]
               [i (in-naturals 1)])
      (values n i)))
  (for/list ([s score])
    (match (hash-ref score-map s)
      [1 "Gold Medal"]
      [2 "Silver Medal"]
      [3 "Bronze Medal"]
      [n (~a n)])))

(find-relative-ranks (list 5 4 3 2 1))
(find-relative-ranks (list 10 3 8 9 4))
