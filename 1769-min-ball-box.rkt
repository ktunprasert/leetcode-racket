#lang racket

;; (define/contract (min-operations boxes)
;;   (-> string? (listof exact-integer?))
;;   )

(define (min-operations boxes)
  (define len (string-length boxes))
  (define ops (make-vector len 0))

  (define (prefix-loop fn [i 0] [end len] [found 0] [idx-sum 0])
    (if (= i end) '()
        (begin
          (vector-set! ops i (+ (vector-ref ops i) (abs (- (* i found) idx-sum))))
          (match (string-ref boxes i)
            [#\0 (begin (prefix-loop fn (fn i) end found idx-sum))]
            [#\1 (begin (prefix-loop fn (fn i) end (add1 found) (+ idx-sum i)))]
            ))))

  (prefix-loop add1)
  (prefix-loop sub1 (sub1 len) -1)
  (vector->list ops )
  )

(require rackunit)

;; (min-operations "110")
(check-equal? (min-operations "110") '(1 1 3))
(check-equal? (min-operations "001011") '(11 8 5 4 3 4))
