#lang racket

(define (min-increment-for-unique nums)
  (define found (make-hash))
  (define max-n -1)
  (for/sum ([n nums] #:do [(set! max-n (max max-n n))])
           (if (hash-has-key? found n)
               (begin0 (- max-n n -1)
                 (set! max-n (max max-n (+ max-n (- max-n n)))))
               (begin0 0
                 (hash-set! found n null)))))

(min-increment-for-unique (list 1 2 2))
(min-increment-for-unique (list 3 2 1 2 1 7))
