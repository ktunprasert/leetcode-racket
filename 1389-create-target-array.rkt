#lang racket

(define (create-target-array nums index)
  (let ([lst (for/list ([n nums]
                        [i index])
               (cons i n))])
    (map cdr (sort (reverse lst) #:key car <))))

(create-target-array '(0 1 2 3 4) '(0 1 2 2 1))
