#lang racket

(define (cal-points operations)
  (let loop ([op operations]
             [carry empty])
    (cond
      [(empty? op) (apply + carry)]
      [(equal? (first op) "C") (loop (rest op) (drop carry 1))]
      [(equal? (first op) "D") (loop (rest op) (cons (* 2 (first carry)) carry))]
      [(equal? (first op) "+") (loop (rest op) (cons (apply + (take carry 2)) carry))]
      ; numeric
      [else (loop (rest op) (cons (string->number (first op)) carry))])))

;; (cal-points '("5" "2" "C" "D" "3"))
(cal-points '("5" "2" "C" "D" "+"))
