#lang racket

(define/contract (running-sum nums)
  (-> (listof exact-integer?) (listof exact-integer?))
  (define total 0)
  (for/list ([n nums])
    (begin0 (+ n total)
      (set! total (+ n total)))))

(running-sum '(1 2 3 4)) ; => '(1 3 6 10)
