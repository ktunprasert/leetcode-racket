#lang racket

(define/match (decrypt code k)
  [(code 0) (make-list (length code) 0)]
  [(_ _)
   (define code-vec (list->vector code))
   (define code-len (vector-length code-vec))
   (define (cyclic-range i)
     (if (negative? k)
         (build-list (abs k) (compose (curryr modulo code-len) (curryr + k i)))
         (build-list k (compose (curryr modulo code-len) (curryr + i 1)))))
   (for/list ([i (in-range code-len)])
     (foldl (λ (i acc) (+ acc (vector-ref code-vec i))) 0 (cyclic-range i)))])

;; (decrypt '(1 2 3 4 5) 0)
(decrypt '(1 2 3 4 5) 1)
;; (decrypt '(5 7 1 4) 3)
;; (decrypt '(2 4 9 3) -2)
