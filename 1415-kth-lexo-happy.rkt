#lang racket

(define chars (list #\a #\b #\c))

(define (generate-happy-strings n)
  (define result '())

  (define (backtrack current-string)
    (cond
      [(= (string-length current-string) n) (set! result (cons current-string result))]
      [else
       (for ([c chars])
         (when (or (= (string-length current-string) 0)
                   (not (char=? c (string-ref current-string (sub1 (string-length current-string))))))
           (backtrack (string-append current-string (string c)))))]))

  (backtrack "")
  (reverse result))

(define (get-happy-string n k)
  (define happy-strings (generate-happy-strings n))
  (if (<= k (length happy-strings))
      (list-ref happy-strings (sub1 k)) ; Convert to 0-indexed
      "")) ; Return empty string if k is out of bounds

(get-happy-string 1 1)
(get-happy-string 3 9)
