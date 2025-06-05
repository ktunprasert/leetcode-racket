#lang racket

;; (define/contract (min-operations boxes)
;;   (-> string? (listof exact-integer?))
;;   )

;; one pass, vector size (length boxes)
;; when current is one broadcast to all the vector the dist where dist = (n - i)
;; 0 skip
;; finally convert
(define (min-operations boxes)
  (define vec (vector-extend #() (string-length boxes )) )
  (for ([(c i) (in-indexed boxes)] #:when (char=? c #\1) )
    (for/vector ([(n j) (in-indexed vec)]) (vector-set! vec j (+ n (abs (- j i))) ))
    )
  (vector->list vec)
  )

(require rackunit)

(check-equal? (min-operations "110") '(1 1 3))
(check-equal? (min-operations "001011") '(11 8 5 4 3 4))
