#lang racket

(define/contract
  (two-sum nums target)
  (-> (listof exact-integer?) exact-integer? (listof exact-integer?))
  (let loop ([i 0] [diff (hash)] [rest nums])
    (when (null? rest) (error "No solution found"))
    (define current (car rest))
    (define target-diff (- target current))

    (cond
      [(hash-has-key? diff target-diff)
       (list (hash-ref diff target-diff) i)
       ]
      [else
       (loop (add1 i) (hash-set diff current i) (cdr rest))
       ]
      )
    )
  )


(two-sum '(2 6 11 15 7) 9)
