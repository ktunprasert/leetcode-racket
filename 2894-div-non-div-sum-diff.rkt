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
    [(= m n) (- (fast-sum n) m)]
    ; do actual computation
    ;; [else 6969]
    [else
     (let loop ([num 1] [acc (fast-sum n)])
       (cond [(> num n) acc]
             [(= 0 (modulo n num)) (loop (add1 num) (- acc (* 2 num) ) )]
             [else
              (loop (add1 num) acc )
              ] ) )]
    )
  )


;; (check-equal? (difference-of-sums 10 3) 19)
;; (check-equal? (difference-of-sums 5 6) 15)
;; (check-equal? (difference-of-sums 5 1) -15)
;; (check-equal? (difference-of-sums 10 2) 19)
(check-equal? (difference-of-sums 15 9) 102)

;; (check-equal? (difference-of-sums 5 5) 10)
;; (check-equal? (difference-of-sums 10 10) 45)
;; (check-equal? (difference-of-sums 100 100) 4950)
