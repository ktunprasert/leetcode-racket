#lang racket

(define (odd-cells m n indices)
  (define matrix (for/vector ([_ m]) (make-vector n 0)))
  (for ([idx indices])
    (define-values (i j) (apply values idx))
    (vector-set! matrix i (vector-map add1 (vector-ref matrix i)))
    (for ([row-idx m])
      (define row (vector-ref matrix row-idx))
      (vector-set! row j (add1 (vector-ref row j)))))

  (for*/sum ([row matrix] [cell row] #:when (odd? cell)) 1))

;; (odd-cells 2 3 '((0 1) (1 1)))
;; (odd-cells 2 2 '((0 0) (1 1)))
(odd-cells 28
           38
           '[[17 16]
             [26 31]
             [19 12]
             [22 24]
             [17 28]
             [23 21]
             [27 32]
             [23 27]
             [23 33]
             [18 7]
             [4 20]
             [0 31]
             [25 33]
             [5 22]]) ; should be 460
