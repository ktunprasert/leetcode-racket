#lang racket

(define (find-intersection-values nums1 nums2)
  (list (count (curryr member nums2) nums1) (count (curryr member nums1) nums2)))

(find-intersection-values (list 2 3 2) (list 1 2))
