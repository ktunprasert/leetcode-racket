#lang racket

(define (count-pairs nums k)
  (define vec (list->vector nums))
  (define len (vector-length vec))
  (for*/sum ([i (in-range len)] [j (in-range (+ i 1) len)]
                                #:when (= (vector-ref vec i) (vector-ref vec j))
                                #:when (zero? (modulo (* i j) k)))
            1))

(count-pairs (list 3 1 2 2 2 1 3) 2)
;; (count-pairs (list 1 2 3 4) 1)
