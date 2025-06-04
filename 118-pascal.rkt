#lang racket


(define (window2 lst)
  (let loop ([lst lst] [out '()])
    (match lst
      [(list a b) (cons (list a b) out)]
      [_ (loop (cdr lst) (cons (list (car lst) (cadr lst)) out))])))

(define (pascal n)
  (match n [1 '(1)] [2 '(1 1)]
    [_ (append
        '(1)
        (map
         (lambda (n) (apply + n))
         (window2 (pascal (sub1 n))))
        '(1))]))

(define/contract (generate numRows)
  (-> exact-integer? (listof (listof exact-integer?)))
  (let loop ([n 1] [lst '()])
    (cond
      [(> n numRows) (reverse lst)]
      [else (loop (add1 n) (cons (pascal n) lst))]
      )
    )
  )

(generate 5)
