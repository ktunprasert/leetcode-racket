#lang racket

(require rackunit)

(define (fast-sum n)
  (/ (* n (add1 n)) 2) ; n/2 * (n+1)
  )

; 1 <= n, m <= 1000
(define (difference-of-sums n m)
  (let* ([k (quotient n m)]
         [total-sum (fast-sum n)]
         ; natural series up to k
         ; expand series into (1 .. n)*m
         ; m1 + m2 + ... + mk
         ; m/2 * (m*k + m)
         [div-sum (* (fast-sum k) m)])
    (- total-sum (* 2 div-sum))))

(check-equal? (difference-of-sums 10 3) 19)
(check-equal? (difference-of-sums 5 6) 15)
(check-equal? (difference-of-sums 5 1) -15)
(check-equal? (difference-of-sums 15 9) 102)

(check-equal? (difference-of-sums 5 5) 5)
(check-equal? (difference-of-sums 7 7) 14)
(check-equal? (difference-of-sums 10 10) 35)
(check-equal? (difference-of-sums 100 100) 4850)
