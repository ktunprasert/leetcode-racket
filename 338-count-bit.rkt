#lang racket

(define (bit-count n [acc 0])
  (if (zero? n)
      acc
      (bit-count (bitwise-and n (sub1 n)) (add1 acc))))

(define (count-bits n)
  (for/list ([n (in-inclusive-range 0 n)])
    (bit-count n)))

(count-bits 2)
(count-bits 5)
