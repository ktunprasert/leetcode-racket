#lang racket

(define (find-difference nums1 nums2)
  (define n1-map
    (for/hash ([n1 nums1])
      (values n1 #t)))
  (define n2-map
    (for/hash ([n2 nums2])
      (values n2 #t)))

  (list (filter (curry (negate hash-has-key?) n2-map) nums1)
        (filter (curry (negate hash-has-key?) n1-map) nums2)))

(find-difference (list 1 2 3) (list 2 4 6))
