#lang racket


(define (window2 lst)
  (let loop ([lst lst] [out '()])
    (match lst
      [(list a b) (append out (list (list a b)))]
      [_ (loop (cdr lst) (append out (list (list (car lst) (cadr lst)))))])))

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
      [(> n numRows) lst]
      [else (loop (add1 n) (append lst (list (pascal n))))]
      )
    )
  )

(generate 5)
