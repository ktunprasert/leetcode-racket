#lang racket

(define (find-matrix nums)
  (let loop ([nums (group-by identity nums)]
             [matrix empty])
    (if (empty? nums)
        (reverse matrix)
        (begin
          (loop (filter-map (lambda (x) (and (not (empty? (cdr x))) (cdr x))) nums)
                (cons (map car nums) matrix))))))

(find-matrix (list 1 3 4 1 2 3 1))
