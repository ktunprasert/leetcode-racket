#lang racket

(define (bit-count n [acc 0])
  (if (zero? n)
      acc
      (bit-count (bitwise-and n (sub1 n)) (add1 acc))))

;; (define/contract (min-bit-flips start goal)
;;   (-> exact-integer? exact-integer? exact-integer?)
;;   (bit-count (abs (- start goal) )))

;; (flip 1 0) ; 1
;; (flip 1 1) ; 0
;; (flip 0 0) ; 0
;; (flip 4 1) ; 1
;; (flip 5 1) ; 0
;; (andor 4 1) ; 1

(define flip (compose (curry bitwise-and 1) bitwise-xor))

(define (min-bit-flips start goal [acc 0])
  (case (list start goal)
    [(0 0) acc]
    [((1 0) (0 1)) (add1 acc)]
    [else
     (min-bit-flips (arithmetic-shift start -1)
                    (arithmetic-shift goal -1)
                    (+ acc (flip start goal)))]))

(min-bit-flips 1 0)
(min-bit-flips 10 7)
(min-bit-flips 3 4)
