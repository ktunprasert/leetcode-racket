#lang racket

(define (number-of-pairs nums1 nums2 k)
  (for/sum ([n1 nums1]) (for/sum ([n2 nums2] #:when (= 0 (modulo n1 (* n2 k)))) 1)))

(number-of-pairs (list 1 3 4) (list 1 3 4) 1)
