#lang racket

(define (check-perfect-number num)
  (if (= num 1)
      false
      (= (sub1 num)
         (for/sum ([n (in-range 2 num)] #:break (> (* n n) num) #:when (zero? (modulo num n)))
                  (+ n (quotient num n))))))

(check-perfect-number 28)
(check-perfect-number 7)
(check-perfect-number 99999997)
(check-perfect-number 1)
