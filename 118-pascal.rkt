#lang racket

(define (pascal-optimized previous-row)
  (if (empty? previous-row)
      '(1)
      (let* ([middle (map +
                          (build-list (sub1 (length previous-row))
                                      (lambda (i)
                                        (+ (list-ref previous-row i)
                                           (list-ref previous-row (add1 i))))))])
        (cons 1 (append middle '(1))))))

(define/contract (generate numRows)
  (-> exact-integer? (listof (listof exact-integer?)))
  (let loop ([n 1]
             [current '()]
             [all '()])
    (cond
      [(> n numRows) (reverse all)]
      [else
       (let ([next-row (pascal-optimized current)]) (loop (add1 n) next-row (cons next-row all)))])))

(generate 5)
