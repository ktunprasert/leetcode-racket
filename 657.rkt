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

;; (define (judge-circle moves [mv-list (string->list moves)] [h 0] [v 0])
;;   (cond
;;     [(empty? mv-list) (= 0 h v)]
;;     [else
;;      (define m (car mv-list))
;;      (cond
;;        [(char=? m #\L) (judge-circle moves (cdr mv-list) (sub1 h) v)]
;;        [(char=? m #\R) (judge-circle moves (cdr mv-list) (add1 h) v)]
;;        [(char=? m #\D) (judge-circle moves (cdr mv-list) h (sub1 v))]
;;        [(char=? m #\U) (judge-circle moves (cdr mv-list) h (add1 v))])]))

(judge-circle "LL")
(judge-circle "UD")
