#lang racket

(define (is-balanced num)
  (define zval (char->integer #\0))
  (define (char->number c)
    (- (char->integer c) zval))
  (for/fold ([even 0]
             [odd 0]
             #:result (= even odd))
            ([ns (in-slice 2 num)])
    (cond
      [(= 1 (length ns)) (values (+ even (char->number (first ns))) odd)]
      [else (values (+ even (char->number (first ns))) (+ odd (char->number (second ns))))])))

(is-balanced "1234")
(is-balanced "24123")
