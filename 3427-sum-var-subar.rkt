#lang racket

(define (subarray-sum nums)
  (for/fold ([sum 0]) ([(n i) (in-indexed nums)])
    (define ni (- i n))
    (define maxi (max 0 ni))
    (values (apply + sum (map (curry list-ref nums) (inclusive-range maxi i))))))

(subarray-sum '(2 3 1))
;; [2,5,1,5]
(subarray-sum '(2 5 1 5)) ;; 28
