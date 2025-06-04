#lang racket

(define/contract
  (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let loop ([i 0] [diff (hash)])
    (when (>= i (length nums)) (error "shouldn't happen"))
    (define current (list-ref nums i))
    (define target-diff (- target current))

    (cond
      [(hash-ref diff target-diff #f)
       (list (hash-ref diff target-diff) i)
       ]
      [else
       (loop (add1 i) (hash-set diff current i))
       ]
      )
    )
  )


(two-sum '(2 6 11 15 7) 9)
