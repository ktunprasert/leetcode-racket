#lang racket

(define (get-final-state nums k multiplier)
  (define mul (curry * multiplier))

  (for ([_ (in-range k)])
    (define n-min (apply min nums))
    (for/first ([n nums]
                [i (in-naturals)]
                #:when (<= n n-min))
      (set! nums (list-update nums i mul))))
  nums)

(get-final-state '(2 1 3 5 6) 5 2)
