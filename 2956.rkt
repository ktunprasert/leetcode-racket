#lang racket

(define (find-intersection-values nums1 nums2)
  (define n1map
    (for/hash ([n nums1])
      (values n #t)))
  (define n2map
    (for/hash ([n nums2])
      (values n #t)))

  (list (count (curry hash-has-key? n2map) nums1) (count (curry hash-has-key? n1map) nums2)))

(find-intersection-values (list 2 3 2) (list 1 2))
