#lang racket

(define/match (decrypt code k)
  [(code 0) (make-list (length code) 0)]
  [(_ _)
   (define code-vec (list->vector code))
   (define code-len (vector-length code-vec))
   (define out (make-hash))
   (define (cyclic-range i k)
     (if (negative? k)
         (build-list (abs k) (compose (curryr modulo code-len) (curryr + k i)))
         (build-list k (compose (curryr modulo code-len) (curryr + i 1)))))
   (for* ([i (in-range code-len)]
          [ix (cyclic-range i k)])
     (hash-update! out i (curry + (vector-ref code-vec ix)) 0))
   (hash-values out #t)])

;; (decrypt '(1 2 3 4 5) 0)
(decrypt '(1 2 3 4 5) 1)
;; (decrypt '(5 7 1 4) 3)
;; (decrypt '(2 4 9 3) -2)
