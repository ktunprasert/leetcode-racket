#lang racket

(define (find-error-nums nums)
  (set! nums (list->vector (sort nums <)))
  (for/first ([n nums]
              [s (in-naturals 1)]
              #:when (= n (vector-ref nums s)))
    (list n s)))

(find-error-nums (list 2 2))
(find-error-nums (list 1 2 2 4))
;; (find-error-nums (list 3 2 3 4 6 5))
