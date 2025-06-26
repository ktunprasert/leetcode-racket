#lang racket

(define (find-difference nums1 nums2)
  (define n1-map
    (for/hash ([n1 nums1])
      (values n1 null)))
  (define n2-map
    (for/hash ([n2 nums2])
      (values n2 null)))

  (list (filter-not (curry hash-has-key? n2-map) (hash-keys n1-map))
        (filter-not (curry hash-has-key? n1-map) (hash-keys n2-map))))

(find-difference (list 1 2 3) (list 2 4 6))
