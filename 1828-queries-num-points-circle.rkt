#lang racket

(define/contract (count-points points queries)
  (-> (listof (listof exact-integer?)) (listof (listof exact-integer?)) (listof exact-integer?))

  (for/list ([q queries])
    (let ([qx (car q)]
          [qy (cadr q)]
          [r-squared (expt (caddr q) 2)])
      (for/sum ([p points] #:when (<= (+ (expt (- (car p) qx) 2) (expt (- (cadr p) qy) 2)) r-squared))
               1))))

(count-points '((1 3) (3 3) (5 3) (2 2)) '((2 3 1) (4 3 1) (1 1 2)))
(count-points '((1 1) (2 2) (3 3) (4 4) (5 5)) '((1 2 2) (2 2 2) (4 3 2) (4 3 3)))
