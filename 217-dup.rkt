#lang racket

(define (contains-duplicate nums)
  (define hsh (make-hash))
  (for/or ([n1 nums])
    (if (hash-ref hsh n1 #f)
        #t
        (begin0 #f
          (hash-set! hsh n1 #t)))))

(contains-duplicate '(1 2 3))
(contains-duplicate '(1 2 3 2))
