#lang racket

(define (find-intersection-values nums1 nums2)
  (define set1 (list->set nums1))
  (define set2 (list->set nums2))
  (list (count (curry set-member? set2) nums1) (count (curry set-member? set1) nums2)))

(find-intersection-values (list 2 3 2) (list 1 2))
