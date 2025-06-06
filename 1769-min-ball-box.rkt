#lang racket

;; (define/contract (min-operations boxes)
;;   (-> string? (listof exact-integer?))
;;   )

;; one pass, vector size (length boxes)
;; when current is one broadcast to all the vector the dist where dist = (n - i)
;; 0 skip
;; finally convert
(define (min-operations boxes)
  (define len (string-length boxes))
  (define ops (vector-extend #() len))
  (define box-vec ((compose list->vector string->list) boxes))

  (define (prefix-loop fn [i 0] [end len] [found 0] [idx-sum 0])
    (if (= i end) '()
        (begin
          ;; (println i)
          ;; (eprintf "i: ~a, found: ~a, idx-sum: ~a\n" i found idx-sum)

          (vector-set! ops i (+ (vector-ref ops i) (abs (- (* i found) idx-sum)) ))
          (match (vector-ref box-vec i)
            [#\0
             (begin
               (prefix-loop fn (fn i) end found idx-sum)
               )]
            [#\1
             (begin
               (prefix-loop fn (fn i) end (add1 found) (+ idx-sum i))
               )]
            ))
        )
    )

  (prefix-loop add1)
  ;; (println ops)
  (prefix-loop sub1 (sub1 len) -1)
  (println ops)
  ;; (string->list)
  ;; (string-reverse)

  (vector->list ops )
  ;; ()
  )

(require rackunit)

;; (min-operations "110")
(check-equal? (min-operations "110") '(1 1 3))
(check-equal? (min-operations "001011") '(11 8 5 4 3 4))
