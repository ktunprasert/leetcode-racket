#lang racket

(require rackunit)

; build-array : nums -> nums
; nums: list-of exact-integer
; 1 <= nums.length <= 1000
; 0 <= nums[i] <= nums.length
(define (build-array nums)
  (define vref (curry vector-ref (list->vector nums)))
  (map vref nums)
  )


(check-equal? (build-array '(0 2 1 5 3 4)) '(0 1 2 4 5 3))
(check-equal? (build-array '(5 0 1 2 3 4)) '(4 5 0 1 2 3))
