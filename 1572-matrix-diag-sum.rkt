#lang racket

(define (diagonal-sum mat)
  (define cols (length (first mat)))
  (define (grid-at mat pair)
    ((compose (curryr list-ref (car pair)) (curryr list-ref (cdr pair))) mat))
  (let loop ([n 0]
             [sum 0])
    (cond
      [(= n cols) sum]
      [else
       (define left-n (grid-at mat (cons n n)))
       (define right-n (grid-at mat (cons n (- cols n 1))))
       (when (= n (- cols n 1))
         (set! left-n 0))
       (loop (add1 n) (+ sum left-n right-n))])))

;; (diagonal-sum '((5)))
(diagonal-sum '((1 2 3) (4 5 6) (7 8 9)))
;; (diagonal-sum '((1 2) (3 4)))
;; (diagonal-sum '((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16)))
