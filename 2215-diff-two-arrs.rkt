#lang racket

(define (find-difference nums1 nums2)
  (define n1set (list->set nums1))
  (define n2set (list->set nums2))

  (list (map set->list (list (set-subtract n1set n2set) (set-subtract n2set n1set)))))

(find-difference (list 1 2 3) (list 2 4 6))
