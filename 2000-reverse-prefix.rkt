#lang racket

(define (reverse-prefix word ch)
  (let loop ([out empty]
             [rest (string->list word)])
    (cond
      [(empty? rest) word]
      [(char=? ch (car rest)) (list->string (append (cons (car rest) out) (cdr rest)))]
      [else (loop (cons (car rest) out) (cdr rest))])))

(reverse-prefix "hello world" #\o)
(reverse-prefix "abcdef" #\f)
