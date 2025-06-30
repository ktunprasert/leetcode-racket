#lang racket

(define/contract (judge-circle moves)
  (-> string? boolean?)
  (for/fold ([horiz 0]
             [verti 0]
             #:result (= 0 horiz verti))
            ([m moves])
    (match m
      [#\L (values (sub1 horiz) verti)]
      [#\R (values (add1 horiz) verti)]
      [#\U (values horiz (add1 verti))]
      [#\D (values horiz (sub1 verti))])))

(judge-circle "LL")
(judge-circle "UD")
