#lang racket

(define (find-even-numbers digits)
  (define freq (make-vector 10 0))
  (for ([d digits])
    (vector-set! freq d (add1 (vector-ref freq d))))

  (define (freq-update i fn)
    (vector-set! freq i (fn (vector-ref freq i))))

  (println freq)

  (for*/list ([a (in-range 1 10)]
              [b 10]
              [c (in-range 0 10 2)]
              #:when (> (vector-ref freq a) 0)
              #:when (> (vector-ref freq b) 0)
              #:when (> (vector-ref freq c) 0))
    (begin0 (list a b c)
      (freq-update b add1)
      (freq-update a add1)
      )
    )
  )

(find-even-numbers '(2 1 3 0))
;; (find-even-numbers '(2 2 8 8 2))
