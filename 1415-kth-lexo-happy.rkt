#lang racket

(define chars (list #\a #\b #\c))

(define (get-happy-string n k)
  (define result '())
  (define found #f)
  (define (backtrack current-chars)
    (cond
      [found #f] ; Early termination
      [(= (length current-chars) n)
       (set! result (cons (list->string (reverse current-chars)) result))
       (when (= (length result) k)
         (set! found #t))]
      [else
       (for ([c chars]
             #:break found)
         (when (and (not found) (or (null? current-chars) (not (char=? c (first current-chars)))))
           (backtrack (cons c current-chars))))]))
  (backtrack '())
  (if (and (>= (length result) k) (> k 0))
      (car result)
      ""))

(get-happy-string 2 1)
(get-happy-string 1 1)
(get-happy-string 3 9)
