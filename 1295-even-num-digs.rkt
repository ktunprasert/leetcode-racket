#lang racket

(define (is-even-digits? n)
  (cond
    [(< n 10e0) #f]
    [(< n 10e1) #t]
    [(< n 10e2) #f]
    [(< n 10e3) #t]
    [(< n 10e4) #f]
    [else #t]))

(define/contract (find-numbers nums)
  (-> (listof exact-integer?) exact-integer?)
  (count is-even-digits? nums))

(find-numbers '[12 345 2 6 7896])
(find-numbers '[300])
(find-numbers '[1000])
