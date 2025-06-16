#lang racket

(define (minimum-sum num)
  (define (get-nums [nums empty] [n num])
    (cond
      [(= 0 n) nums]
      [else (get-nums (cons (remainder n 10) nums) (quotient n 10))]))
  (let*-values ([(nums) (sort (get-nums empty num) <)]
                [(tens singles) (split-at nums 2)])
    (foldl + 0 (append singles (map (curry * 10) tens)))))

(minimum-sum 1234)
