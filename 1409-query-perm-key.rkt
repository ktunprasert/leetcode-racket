#lang racket

(define (process-queries queries m)
  (define plist (inclusive-range 1 m))
  (for/list ([q queries])
    (begin0 (index-of plist q)
      (set! plist (cons q (remove q plist))))))

(process-queries (list 3 1 2 1) 5)
