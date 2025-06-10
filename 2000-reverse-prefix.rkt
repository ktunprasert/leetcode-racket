#lang racket

(define (reverse-prefix word ch)
  (define ch-idx (string-find word (format "~a" ch)))
  (define word-list (string->list word))
  (define reversed (reverse (take word-list (add1 ch-idx))))
  (list->string (append reversed (drop word-list (add1 ch-idx))))
  )

(reverse-prefix "hello world" #\o)
