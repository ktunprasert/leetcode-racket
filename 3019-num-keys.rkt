#lang racket

(define/contract (count-key-changes s)
  (-> string? exact-integer?)
  (define slow (string-downcase s))
  (let loop ([s (string->list slow)]
             [total 0])
    (cond
      [(empty? s) total]
      [(= 1 (length s)) total]
      [else (loop (cdr s) (+ total (if (not (char=? (car s) (cadr s))) 1 0)))])))

(count-key-changes "Bbc")
