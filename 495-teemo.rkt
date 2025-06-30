#lang racket

;; (println (list total ns prev-end))

(define (find-poisoned-duration timeSeries duration)
  (+ duration
     (for/sum ([t timeSeries] [a (drop timeSeries 1)])
              (if (<= (- a t) duration)
                  (- a t)
                  (- a t 1)))))

;; (find-poisoned-duration (list 1 4) 2)
;; (find-poisoned-duration (list 1 3) 3)
;; (find-poisoned-duration (list 1 2) 2)
;; (find-poisoned-duration (list 1 1) 2)
;; (find-poisoned-duration (list 1 1 2) 2)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 10)
;; (find-poisoned-duration (list 1 9) 10)
;; (find-poisoned-duration (list 1 10) 10)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9 10) 10)
(find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 1)
