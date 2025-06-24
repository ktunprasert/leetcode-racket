#lang racket

(define (find-intersection-values nums1 nums2)
  (list (count (curry index-of nums2) nums1) (count (curry index-of nums1) nums2)))

(find-intersection-values (list 2 3 2) (list 1 2))
