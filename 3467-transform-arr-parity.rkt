#lang racket

; the immediate thought is to create vector[N]
; keep index at last item
; when find odd change to 1 then idx--
(define (transform-array nums)
  ;; (-> (listof exact-integer?) (listof exact-integer?))
  (define transformed (make-vector (length nums)))
  (let loop ([i (sub1 (length nums))]
             [n nums])
    (cond
      [(eq? '() n) (vector->list transformed)]
      [(odd? (car n))
       (begin
         (vector-set! transformed i 1)
         (loop (sub1 i) (cdr n)))]
      [else (loop i (cdr n))])))

(require rackunit)

(check-equal? (transform-array '(4 3 2 1)) '(0 0 1 1))
