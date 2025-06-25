#lang racket

(define/match (decrypt code k)
  [(code 0) (make-list (length code) 0)]
  [(_ _)
   (define code-vec (list->vector code))
   (define code-len (vector-length code-vec))
   (define cyclic-range
     (if (negative? k)
         (build-list (abs k) (curryr + k))
         (build-list k (curryr + 1))))
   (for/list ([i (in-range code-len)])
     (foldl (λ (i acc) (+ acc (vector-ref code-vec i)))
            0
            (map (compose (curryr modulo code-len) (curry + i)) cyclic-range)))])

;; (decrypt '(1 2 3 4 5) 0)
;; (decrypt '(1 2 3 4 5) 1)
;; (decrypt '(5 7 1 4) 3)
(decrypt '(2 4 9 3) -2)
