#lang racket

(define (diagonal-sum mat)
  (define cols (length (first mat)))
  (let loop ([offset 0]
             [n 0]
             [sum 0])
    (cond
      [(= offset cols) sum]
      [else
       (define left (cons n n))
       (define right (cons n (- cols offset 1)))
       (define left-n (list-ref (list-ref mat (car left)) (cdr left)))
       (define right-n (list-ref (list-ref mat (car right)) (cdr right)))
       (when (equal? left right)
         (set! left-n 0))
       (loop (add1 offset) (add1 n) (+ sum left-n right-n))])))

(diagonal-sum '((5)))
;; (diagonal-sum '((1 2 3) (4 5 6) (7 8 9)))
;; (diagonal-sum '((1 2) (3 4)))
;; (diagonal-sum '((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16)))
