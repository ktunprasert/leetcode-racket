#lang racket

(define (find-poisoned-duration timeSeries duration)
  (define m (make-hash))
  (for* ([t timeSeries]
         [t2 (in-range t (+ t duration))])
    (hash-set! m t2 void))
  (hash-count m))

(find-poisoned-duration (list 1 4) 2)
(find-poisoned-duration (list 1 2) 2)
