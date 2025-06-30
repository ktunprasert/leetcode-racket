#lang racket

(define (find-relative-ranks score)
  (set! score (list->vector score))
  (define score-map (make-hash))
  (for ([n (vector-sort score >)]
        [i (sequence-append (list "Gold Medal" "Silver Medal" "Bronze Medal") (in-naturals 4))])
    (hash-set! score-map n (~a i)))
  (for/list ([s score])
    (hash-ref score-map s)))

(find-relative-ranks (list 5 4 3 2 1))
(find-relative-ranks (list 10 3 8 9 4))
