#lang racket

(define (bit-count n [acc 0])
  (if (zero? n)
      acc
      (bit-count (bitwise-and n (sub1 n)) (add1 acc))))

(define (min-bit-flips start goal)
  (bit-count (bitwise-xor start goal))
  )

(min-bit-flips 1 0)
(min-bit-flips 10 7)
(min-bit-flips 3 4)
