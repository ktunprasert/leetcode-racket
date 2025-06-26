#lang racket

(define (find-difference nums1 nums2)
  (map (compose set->list list->set) (list (remove* nums2 nums1) (remove* nums1 nums2))))

(find-difference (list 1 2 3) (list 2 4 6))
