#lang racket

;; (println (list total ns prev-end))
(define (find-poisoned-duration timeSeries duration)
  (let loop ([total 0]
             [t timeSeries]
             [prev-end 0])
    ;; (println (list total t prev-end))
    (cond
      [(empty? t) total]
      [(< (car t) prev-end)
       (loop (+ total (+ (car t) duration -2 (- prev-end) (- prev-end (car t)) )) (cdr t) (+ (car t) duration -1))]
      [else (loop (+ total duration) (cdr t) (+ (car t) duration -1))])
    )
  )

(find-poisoned-duration (list 1 3) 3)
;; (find-poisoned-duration (list 1 4) 2)
(find-poisoned-duration (list 1 2) 2)
;; (find-poisoned-duration (list 1 1) 2)
;; (find-poisoned-duration (list 1 1 2) 2)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 10)
;; (find-poisoned-duration (list 1 9) 10)
;; (find-poisoned-duration (list 1 10) 10)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9 10) 10)
