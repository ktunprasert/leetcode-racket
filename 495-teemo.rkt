#lang racket

(define (find-poisoned-duration timeSeries duration)
  (let loop ([total 0]
             [ns timeSeries]
             [prev-end 0])
    (cond
      [(empty? ns) total]
      [(= (car ns) prev-end) (loop (+ total (sub1 duration)) (cdr ns) (+ (car ns) (sub1 duration)))]
      [(= (car ns) (sub1 prev-end))
       (loop (+ total (- duration 2)) (cdr ns) (+ (car ns) (sub1 duration)))]
      [(< (car ns) prev-end) (loop total (cdr ns) prev-end)]
      [else (loop (+ duration total) (cdr ns) (+ (car ns) (sub1 duration)))])))

(find-poisoned-duration (list 1 4) 2)
(find-poisoned-duration (list 1 2) 2)
(find-poisoned-duration (list 1 1) 2)
(find-poisoned-duration (list 1 1 2) 2)
(find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 10)
