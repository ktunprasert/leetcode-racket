#lang racket

(define (subarray-sum nums)
  (for/fold ([sum 0]) ([(n i) (in-indexed nums)])
    (define ni (- i n))
    (define maxi (max 0 ni))
    (values (apply + sum (take (drop nums maxi) (add1 (- i maxi)))))))

(subarray-sum '(2 3 1))
(subarray-sum '(2 5 1 5)) ;; 28
