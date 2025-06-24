#lang racket

(define (sum-odd-length-subarrays arr)
  (define arr-len (length arr))
  (define slices (inclusive-range 1 (length arr) 2))
  (for*/sum ([s slices] [i (in-inclusive-range 0 (- arr-len s))])
            (apply + (take (drop arr i) s))))

;; (sum-odd-length-subarrays (list 1 4 2 5 3))
;; (sum-odd-length-subarrays (list 1 2))
(sum-odd-length-subarrays (list 10 11 12))
