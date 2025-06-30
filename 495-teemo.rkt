#lang racket

;; (println (list total ns prev-end))

(define (find-poisoned-duration series duration)
  (define tlen (length series))
  (define time (* duration tlen))
  (for ([a series]
        [b (drop series 1)]
        #:when (< b (+ a duration)))
    (set! time (+ (- time duration) (- b a))))
  time)

;; (find-poisoned-duration (list 1 4) 2)
(find-poisoned-duration (list 1 3) 3)
;; (find-poisoned-duration (list 1 2) 2)
;; (find-poisoned-duration (list 1 1) 2)
;; (find-poisoned-duration (list 1 1 2) 2)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 10)
;; (find-poisoned-duration (list 1 9) 10)
;; (find-poisoned-duration (list 1 10) 10)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9 10) 10)
;; (find-poisoned-duration (list 1 2 3 4 5 6 7 8 9) 1)
