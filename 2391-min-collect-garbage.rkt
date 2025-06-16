#lang racket

(define (take-i lst n)
  (take lst (- (length lst) n)))

(define (garbage-collection garbage travel)
  (define gbg (reverse garbage))
  (let ([Gi (index-where gbg (curryr string-contains? "G"))]
        [Pi (index-where gbg (curryr string-contains? "P"))]
        [Mi (index-where gbg (curryr string-contains? "M"))])
    (define total 0)
    (when Gi
      (set! total (apply + total (take-i travel Gi))))
    (when Pi
      (set! total (apply + total (take-i travel Pi))))
    (when Mi
      (set! total (apply + total (take-i travel Mi))))

    (apply + total (map string-length garbage))))

;; (garbage-collection (list "G" "P" "GP" "MGP") (list 2 4 3))
(garbage-collection (list "G" "P" "GP" "GG") (list 2 4 3))
