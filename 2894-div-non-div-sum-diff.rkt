#lang racket

(require rackunit)

(define (fast-sum n)
  (/ (* n (add1 n)) 2)
  )

; 1 <= n, m <= 1000
(define (difference-of-sums n m)
  (cond
    [(> m n) (fast-sum n)]
    [(= m 1) (- (fast-sum n))]
    [(= m n) (- (fast-sum n) (* 2 m))]
    [else
     (let loop ([num 1] [acc (fast-sum n)])
       (cond [(> num n) acc]
             [(= 0 (modulo num m )) (loop (add1 num) (- acc (* 2 num) ) )]
             [else
              (loop (add1 num) acc )
              ] ) )]
    )
  )


(check-equal? (difference-of-sums 10 3) 19)
(check-equal? (difference-of-sums 5 6) 15)
(check-equal? (difference-of-sums 5 1) -15)
(check-equal? (difference-of-sums 15 9) 102)

(check-equal? (difference-of-sums 5 5) 5)
(check-equal? (difference-of-sums 7 7) 14)
(check-equal? (difference-of-sums 10 10) 35)
(check-equal? (difference-of-sums 100 100) 4850)
