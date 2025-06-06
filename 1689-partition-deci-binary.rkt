#lang racket

; first glance - just find maximum char and return that
(define (min-partitions n)
  (for/fold ([max-char 0])
            ([c n]
             #:when (not (char=? #\0 c)))
    (values (max (- (char->integer c) 48) max-char))))

(min-partitions "32")
(min-partitions "10000000000000000000000000009")
