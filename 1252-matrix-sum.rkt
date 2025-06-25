#lang racket

(define (odd-cells m n indices)
  (define matrix (make-vector m (make-vector n 0)))
  (for ([idx indices])
    (define-values (i j) (apply values idx))
    (vector-set! matrix i (vector-map add1 (vector-ref matrix i)))
    (vector-map (lambda (v) (vector-set! v j (add1 (vector-ref v j)))) matrix))

  (for*/sum ([row matrix] [cell row] #:when (odd? cell)) 1))

(odd-cells 2 3 '((0 1) (1 1)))
(odd-cells 2 2 '((0 0) (1 1)))
