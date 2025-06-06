#lang racket

; first glance - just find maximum char and return that
(define (min-partitions n)
  (- (apply max (map char->integer (string->list n))) 48))

(min-partitions "32")
(min-partitions "10000000000000000000000000009")
