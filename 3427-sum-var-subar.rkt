#lang racket

(define (subarray-sum nums)
  (define vnum (list->vector nums))
  (for/sum ([(n i) (in-indexed nums)])
           (define ni (- i n))
           (define maxi (max 0 ni))
           (apply + (map (curry vector-ref vnum) (inclusive-range maxi i)))))

(subarray-sum '(2 3 1))
(subarray-sum '(2 5 1 5)) ;; 28
