#lang racket

(define (next-greater-element nums1 nums2)
  (define maxmap (make-hash))
  (for ([(n i) (in-indexed nums2)])
    (for/first ([m (drop nums2 i)]
                #:when (> m n))
      (hash-set! maxmap n m)))
  (map (λ (n) (hash-ref maxmap n -1)) nums1))

(next-greater-element (list 4 1 2) (list 1 3 4 2))
