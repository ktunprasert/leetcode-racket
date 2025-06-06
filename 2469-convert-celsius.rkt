#lang racket

(define (convert-temperature celsius)
  (list (+ 273.15 celsius) (+ 32. (* 1.8 celsius))))

(require rackunit)

(check-equal? (convert-temperature 0) (list 273.15 32.))
(check-equal? (convert-temperature 100) (list 373.15 212.0))
;; (check-equal? (convert-temperature -40) (list 233.15 -40.0))
