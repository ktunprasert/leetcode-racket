#lang racket

(define (min-moves-to-seat seats students)
  (foldl (lambda (x y acc) (+ acc (abs (- y x)))) 0 (sort seats <) (sort students <)))

(min-moves-to-seat '(3 1 5) '(2 7 4)) ; => 4
(min-moves-to-seat '(4 1 5 9) '(1 3 2 6))
