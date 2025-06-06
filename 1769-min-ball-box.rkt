#lang racket

;; (define/contract (min-operations boxes)
;;   (-> string? (listof exact-integer?))
;;   )

(define (min-operations boxes)
  (define len (string-length boxes))
  (define ops (make-vector len 0))

  (define left-sum 0)
  (define left-found 0)
  (for ([i (in-range len)])
    (when (char=? (string-ref boxes i) #\1)
      (set! left-sum (+ left-sum i))
      (set! left-found (add1 left-found))
      )
    (vector-set! ops i (- (* i left-found) left-sum))
    )

  (define right-sum 0)
  (define right-found 0)
  (for ([i (in-range (sub1 len) -1 -1)])
    (when (char=? (string-ref boxes i) #\1)
      (set! right-sum (+ right-sum i))
      (set! right-found (add1 right-found))
      )

    (vector-set! ops i (+ (vector-ref ops i) (- right-sum (* i right-found) ) ) )
    )

  (vector->list ops)
  )

(require rackunit)

;; (min-operations "110")
(check-equal? (min-operations "110") '(1 1 3))
(check-equal? (min-operations "001011") '(11 8 5 4 3 4))
