#lang racket

(define chars (list #\a #\b #\c))

(define (generate-happy-strings n)
  (define result '())
  (define (backtrack current-chars)
    (cond
      [(= (length current-chars) n) (set! result (cons (reverse current-chars) result))]
      [else
       (for ([c chars])
         (when (or (null? current-chars) (not (char=? c (first current-chars))))
           (backtrack (cons c current-chars))))]))

  (backtrack '())
  (reverse result))

(define (get-happy-string n k)
  (define happy-strings (generate-happy-strings n))
  (if (<= k (length happy-strings))
      (list->string (list-ref happy-strings (sub1 k)))
      ""))

(get-happy-string 1 1)
(get-happy-string 3 9)
