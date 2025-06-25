#lang racket

(define (find-even-numbers digits)
  (define freq (make-vector 10 0))
  (for ([d digits])
    (vector-set! freq d (add1 (vector-ref freq d))))
  (define (freq-ref n)
    (vector-ref freq n))
  (for*/list ([a (in-range 1 10)]
              [b 10]
              [c (in-range 0 10 2)]
              #:when (> (freq-ref a) 0)
              #:when (> (freq-ref b) 0)
              #:when (> (freq-ref c) 0)
              #:unless (and (= a b c) ((negate >) (freq-ref a) 2))
              #:unless (and (= a b) ((negate >) (freq-ref a) 1))
              #:unless (and (= a c) ((negate >) (freq-ref a) 1))
              #:unless (and (= b c) ((negate >) (freq-ref b) 1)))
    (+ (* 100 a) (* 10 b) c)))

(find-even-numbers '(2 1 3 0))
(find-even-numbers '(2 2 8 8 2))
