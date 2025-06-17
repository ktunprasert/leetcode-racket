#lang racket

(define (top-k-frequent nums k)
  (define ns (group-by identity nums))
  (define (take-while lst [out empty])
    (cond
      [(= k (length out)) out]
      [else
       (define ls (argmax length lst))
       (take-while (remove ls lst) (cons (first ls) out))]))
  (take-while ns))

(top-k-frequent '(1 1 1 2 2 3) 2) ; 1 2
(top-k-frequent '(1) 1) ; 1
(top-k-frequent '(3) 1) ; 1
(top-k-frequent '(1 2) 2) ; 1
(top-k-frequent '(-1 -2 -1 -2 -1 -2 -1 -1 9 -162931 96987 694873) 2) ; 1
