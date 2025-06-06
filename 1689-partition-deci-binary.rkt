#lang racket

; first glance - just find maximum char and return that
(define (min-partitions n)
  (for/fold ([max-char #\0]
             #:result (- (char->integer max-char) 48))
            ([c n]
             #:when (not (char=? #\0 c)))
    (values (if (char>? c max-char) c max-char))))

(min-partitions "32")
(min-partitions "10000000000000000000000000009")
