#lang racket

(define (sum-odd-length-subarrays arr)
  (define slices (filter odd? (inclusive-range 1 (length arr))))
  (for*/sum ([s slices])
            (for/sum ([i (in-inclusive-range 0 (- (length arr) s))])
                     ;; (println (list s (take (drop arr i) s )))
                     (apply + (take (drop arr i) s)))))

;; (sum-odd-length-subarrays (list 1 4 2 5 3))
;; (sum-odd-length-subarrays (list 1 2))
(sum-odd-length-subarrays (list 10 11 12))
