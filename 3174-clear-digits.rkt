#lang racket

(define (clear-digits s)
  (let loop ([s (string->list s)])
    (cond
      [(andmap char-alphabetic? s) (list->string s)]
      [else
       (define-values (head tail) (split-at s (index-where s char-numeric?)))
       (loop (append (drop-right head 1) (drop tail 1)))])))

(clear-digits "abc")
(clear-digits "cb34")
