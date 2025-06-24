#lang racket

(define (self-dividing-numbers left right)
  (define target (inclusive-range left right))
  (define (digits n [acc empty])
    (cond
      [(zero? n) acc]
      [else (digits (quotient n 10) (cons (remainder n 10) acc))]))
  (define digs empty)
  (for/list ([n target]
             #:do [(set! digs (digits n))]
             #:when (not (index-of digs 0))
             #:when (andmap (λ (div) (zero? (modulo n div))) (digits n)))
    n))

(self-dividing-numbers 1 22)
