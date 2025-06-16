#lang racket

(define (restore-string s indices)
  (let* ([pairlist (for/list ([i indices]
                              [s s])
                     (cons i s))]
         [spair (sort pairlist (lambda (a b) (< (car a) (car b))))]
         [s (map cdr spair)])

    (list->string s)))

(restore-string "codeleet" (list 4 5 6 7 0 2 1 3))
