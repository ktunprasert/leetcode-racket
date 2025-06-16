#lang racket

(define (sum-of-multiples n)
  (define n3 (inclusive-range 0 n 3))
  (define n5 (inclusive-range 0 n 5))
  (define n7 (inclusive-range 0 n 7))
  (apply + (remove-duplicates (append n3 n5 n7))))

(sum-of-multiples 7)
(sum-of-multiples 10)
