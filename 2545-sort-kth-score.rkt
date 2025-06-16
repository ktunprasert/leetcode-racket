#lang racket

(define (sort-the-students score k)
  (sort score (lambda (a b) (> (list-ref a k) (list-ref b k)))))

(sort-the-students (list (list 3 4) (list 5 6)) 0)
