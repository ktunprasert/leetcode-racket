#lang racket

(define (maximum-difference nums)
  (for/fold ([local-max -1])
            ([i (in-range (sub1 (length nums)))])
    (define ns (drop nums i))
    (apply max (cons local-max (map (curryr - (first ns)) (filter (curryr > (first ns)) (rest ns)))))))

(maximum-difference '(7 1 5 4))
(maximum-difference '(9 4 3 2))
(maximum-difference '(1 5 2 10))
