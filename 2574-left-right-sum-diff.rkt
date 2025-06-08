#lang racket

(define (left-right-difference nums)
  (define total (apply + nums))
  (for/fold ([prefix 0]
             [suffix total]
             [output empty]
             #:result (reverse output))
            ([n (in-list nums)])
    (values (+ prefix n) (- suffix n) (cons (abs (- prefix (- suffix n))) output))))

(left-right-difference (quote (10 4 8 3)))
