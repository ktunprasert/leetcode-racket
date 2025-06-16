#lang racket

(define (maximum-difference nums)
  (for/fold ([local-max -1]) ([i (in-range (sub1 (length nums)))])
    (define ns (drop nums i))
    (for/fold ([local-max local-max])
              ([n ns]
               #:when (> n (first ns)))
      (max local-max (- n (first ns))))))

(maximum-difference '(7 1 5 4))
(maximum-difference '(9 4 3 2))
(maximum-difference '(1 5 2 10))
