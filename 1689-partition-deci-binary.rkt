#lang racket

; first glance - just find maximum char and return that
(define (min-partitions n)
  (- (char->integer (car (sort (string->list n) char>?))) 48))

(min-partitions "32")
(min-partitions "10000000000000000000000000009")
