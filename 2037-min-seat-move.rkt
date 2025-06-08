#lang racket

(define (min-moves-to-seat seats students)
  (let ([seats (sort seats <)]
        [students (sort students <)])
    (for/sum ([n (in-list seats)] [m (in-list students)]) (abs (- m n)))))

(min-moves-to-seat '(3 1 5) '(2 7 4)) ; => 4
(min-moves-to-seat '(4 1 5 9) '(1 3 2 6))
