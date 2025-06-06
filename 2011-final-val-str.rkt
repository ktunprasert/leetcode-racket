#lang racket

(define (final-value-after-operations operations)
  (for/sum ([op operations]) (if (char=? #\+ (string-ref op 1)) 1 -1))
  )


(final-value-after-operations (list "++x" "x++"))
